<?php

class EvaluateController extends Zend_Controller_Action
{

	protected $answerToQuestionTable;
	protected $questionTable;
	protected $questionnaireTable;
	protected $participantTable;

	public function init(){
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

		//Incoming link from Email
		if ($request->isGet()){				
			$participantID = $request->getParam('id');
		//Save
		}else if ($request->isPost()){		
			echo "post ";
			$participantID = $request->getParam('participantID');
		}
		//Is valid sha1
		if ((bool) preg_match('/^[0-9a-f]{40}$/i', $participantID)){
			$participants = $this->participantTable->find($participantID);
			if (count($participants) > 0){
				$participant = $participants->current();
				//Get questionnaire to participant
				$questionnaires = $this->questionnaireTable->find($participant->questionnaireId);
				if (count($questionnaires) > 0){
					$questionnaire = $questionnaires->current();
					$today = date("Y-m-d");
					//Check if questionnaire still running
					if($today > $questionnaire->expirationDate){
						$this->view->error = "Diese Evaluation ist beendet";
						return false;
					}
					$categoryQuestions = $this->questionTable->fetchAll($this->questionTable->select()
						->where('category = ?', $questionnaire->category)
						->order('prio DESC'));

					$form = $this->generateForm($participantID, $categoryQuestions);
		
					if ($request->isGet()){
						$this->generateDescr($questionnaire);
						$this->view->form = $form;
					} else if ($request->isPost()){
						$answerhash = sha1(uniqid(mt_rand(), true));
						$form->populate($this->_request->getPost());
						foreach($categoryQuestions as $question){
							$answer = $this->answerToQuestionTable->createRow();
							$answer->questionId = $question->id;
							$answer->questionnaireId = $questionnaire->id;
							$answer->answerhash = $answerhash;
							if($question->type == "radio"){
								$answer->answernumber = $form->getValue($question->id);
							} else {
								$answer->answertext = $form->getValue($question->id);
							}
							$answer->save();
						}
						$courseAnswer = $this->answerToQuestionTable->createRow();
						$courseAnswer->questionId = 1;
						$courseAnswer->questionnaireId = $questionnaire->id;
						$courseAnswer->answerhash = $answerhash;
						$courseAnswer->answertext = $form->getValue("course");
						$courseAnswer->save();

						$semesterAnswer = $this->answerToQuestionTable->createRow();
						$semesterAnswer->questionId = 2;
						$semesterAnswer->questionnaireId = $questionnaire->id;
						$semesterAnswer->answerhash = $answerhash;
						$semesterAnswer->answernumber = $form->getValue("semester");
						$semesterAnswer->save();

						$semesterAnswer = $this->answerToQuestionTable->createRow();
						$semesterAnswer->questionId = 3;
						$semesterAnswer->questionnaireId = $questionnaire->id;
						$semesterAnswer->answerhash = $answerhash;
						$semesterAnswer->answernumber = $form->getValue("visited");
						$semesterAnswer->save();

						$this->deleteParticipant($participantID);
						$this->view->formsaved = true;	
					}
				} else {	//(count($questionnaires) > 0)
					$this->view->error = "No questionnaire found";
				}
			} else {	//(count($participants) > 0)
				$this->view->error = "Der Evaluationszeitraum ist beendet oder die Evaluation über diesen Link wurde bereits abgeschlossen";
			}
		} else {	//((bool) preg_match('/^[0-9a-f]{40}$/i', $participantID))
			$this->view->error = "No hash found or hash invalid";
		}		
		
	}

	private function generateDescr($questionnaire){
		$this->view->questName = $questionnaire->courseName;
		$this->view->questSemester = $questionnaire->semester;
		$this->view->profName = 'DummyName';
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
		'semester', array('label' => 'Semester:'));
		$semesterElement->setMultiOptions(array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14));

		$visitedElement = new Zend_Form_Element_Multiselect(
		'visited', array('label' => '% der Veranstaltung besucht:'));
		$visitedElement->setMultiOptions(array(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100));

		$fixedElements = array(	$parIDElement,
								$courseElement, 
								$semesterElement,
								$visitedElement);
		$form->addElements($fixedElements);

		foreach($categoryQuestions as $question){
			if($question->type == "radio"){
				$element = new Zend_Form_Element_Radio(
				$question->id, array('label' => $question->text));
				$element->setMultiOptions(array('0' => "keine Angabe", '1' => "Trifft zu", '2' => "" , '3' => "Trifft teilweise zu", '4' => "" , '5' => "Trifft nicht zu"));
				$element->setValue(array("0"));
				$form->addElement($element, $question->id);
			} else if($question->type == "text"){
				$element = new Zend_Form_Element_Text(
				$question->id, array('label' => $question->text));
				$element->addFilter('StripTags');
				$form->addElement($element, $question->id);
			}  else if($question->type == "musel"){
				$element = new Zend_Form_Element_Multiselect(
				$question->id, array('label' => $question->text));
				$element->setMultiOptions(array(1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5, 6.0));
				$form->addElement($element, $question->id);
			}
		}

		$submitElement = new Zend_Form_Element_Submit(
		'submit', array('label'=>'Speichern'));

		$form->addElement($submitElement, 'submit');

		return $form;
	}

	private function deleteParticipant($participantID){
		$participants = $this->participantTable->find($participantID);
		$participant = $participants->current();
		$participant->delete();
		$participants = $this->participantTable->find($participantID);
		if(count($participants) > 0){
			return false;
		}
		return true;
	}
}