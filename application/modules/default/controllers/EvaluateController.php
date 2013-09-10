<?php

class EvaluateController extends Zend_Controller_Action
{

	protected $answerToQuestionTable;
	protected $questionTable;
	protected $questionnaireTable;
	protected $participantTable;

	public function init()
	{
		$this->answerToQuestionTable = new Application_Model_DbTable_AnswerToQuestionTable();
		$this->questionnaireTable = new Application_Model_DbTable_QuestionnaireTable();
		$this->questionTable = new Application_Model_DbTable_QuestionTable();
		$this->participantTable = new Application_Model_DbTable_ParticipantTable();
			
	}

	public function indexAction(){
	}

	public function evaluateAction(){
		$request = $this->getRequest();
		$participantID = null;		//Incoming ID per Link
		$participant = null;		//participant Object from DB
		$questionnaire = null;		//questionnaire Object from DB
		$categoryQuestions = array();

		
		if ($request->isGet()){				//Incoming link from Email
			$participantID = $request->getParam('id');
		}else if ($request->isPost()){		//Save
			echo "post ";
			$participantID = $request->getParam('participantID');
		}
		if ((bool) preg_match('/^[0-9a-f]{40}$/i', $participantID)){
			$participants = $this->participantTable->find($participantID);
			if (count($participants) > 0){
				$participant = $participants->current();
				//Get questionnaire to participant
				$questionnaires = $this->questionnaireTable->find($participant->questionnaireId);
				if (count($questionnaires) > 0){
					$questionnaire = $questionnaires->current();
					//Get all questions
					$allQuestions = $this->questionTable->fetchAll();
					$i = 0;
					foreach($allQuestions as $question){
						//Sort out questions who are not in the same category as questionnaire
						if($question->category == $questionnaire->category){
							$categoryQuestions[$i]  = $question;
							$i = $i + 1;
						}
					}
					$form = $this->generateForm($participantID, $categoryQuestions);
		
					if ($request->isGet()){
						$this->view->form = $form;
					} else if ($request->isPost()){
						$form->populate($this->_request->getPost());
						foreach($categoryQuestions as $question){
							$answer = $this->answerToQuestionTable->createRow();
							$answer->questionId = $question->id;
							$answer->questionnaireid = $questionnaire->id;
							if($question->type == "radio"){
								$answer->answernumber = $form->getValue($question->id);
							} else if($question->type == "text"){
								$answer->answertext = $form->getValue($question->id);
								
							}
							$answer->save();
						}
						$this->view->formsaved = true;	
					}
				} else {	//(count($questionnaires) > 0)
					$this->view->error = "No questionnaire found";
				}
			} else {	//(count($participants) > 0)
				$this->view->error = "Hash not found";
			}
		} else {	//((bool) preg_match('/^[0-9a-f]{40}$/i', $participantID))
			$this->view->error = "No hash found or hash invalid";
		}		
		
	}

	private function generateForm($participantID, $categoryQuestions){
		$form = new Zend_Form;
		$form->setMethod('post');

		$parIDElement = new Zend_Form_Element_Hidden(
		'participantID', array('value' => $participantID));

		$courseElement = new Zend_Form_Element_Text(
		'course', array('label' => 'Studiengang:'));
		$courseElement->addFilter('StripTags');

		$semesterElement = new Zend_Form_Element_Multiselect(
		'semester', array('label' => 'Semester'));
		$semesterElement->setMultiOptions(array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14));

		$fixedElements = array(	$parIDElement,
								$courseElement, 
								$semesterElement);
		$form->addElements($fixedElements);

		foreach($categoryQuestions as $question){
			if($question->type == "radio"){
				$element = new Zend_Form_Element_Radio(
				$question->id, array('label' => $question->text));
				$element->setMultiOptions(array("Trifft zu", "" , "Trifft teilweise zu", "" , "Trifft nicht zu"));
				$form->addElement($element, $question->id);
			} else if($question->type == "text"){
				$element = new Zend_Form_Element_Text(
				$question->id, array('label' => $question->text));
				$element->addFilter('StripTags');
				$form->addElement($element, $question->id);
			}
		}

		$submitElement = new Zend_Form_Element_Submit(
		'submit', array('label'=>'Speichern'));

		$form->addElement($submitElement, 'submit');

		return $form;
	}
}