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
		$participantID = null;
		$request = $this->getRequest();

		if ($request->isGet()){
			$participantID = $request->getParam('id');			
			$this->view->form = $this->generateForm($participantID);
			
		} else if ($request->isPost()){
			echo "post ";
			$participantID = $request->getParam('participantID');
			$participants = $this->participantTable->find($participantID);
			$participant = $participants->current();
			$questionnaireid = $participant->questionnaireId;
			$form = $this->generateForm($participantID);
			if ($form->isValid($_POST)){
				echo "for is valid post ";
				$allQuestions = $this->questionTable->fetchAll();
				//Find an answer in post for all questions of category
				foreach($allQuestions as $question){
					echo $question->category;
					echo $request->getParam('category');
					echo $
					if($question->category == $request->getParam('category')){
						echo "if($question->category == $request->getParam('category')){ </br> ";
						$questionId = $question->id;
						$answer = $this->answerToQuestionTable->createRow();
						$answer->answertext = $form->getValue($questionId);
						$answer->questionId = $question->id;
						$answer->questionnaireid = $questionnaireid;
						$answer->save();
						echo "Answer eingetragen";
					}
				}
				
			}
		}
		/*$participant->questionnaireId;

		//echo sha1(uniqid(mt_rand(), true));
		
		$form = $this->generateForm();
		$this->view->form = $form;

		//zu participantID die entsprechende Evaluation suchen
		//entspechendes Formular aufbauen*/
	}

	public function saveAction(){
		$request = $this->getRequest();

		if ($request->isPost()){
			$answerhash = sha1(uniqid(mt_rand(), true));
			$answer = $this->answerToQuestionTable->createRow();
			$answer->answerhash = $answerhash;
			$answer->answertext = $form->getValue('81');
			$answer->questionId = 81;
			$answer->save();
			$this->redirect('index');
		}
	}

	private function generateForm($participantID = null){
		if($participantID != null) {
			$categoryQuestions = $this->getQuestionsToParID($participantID);
			if($categoryQuestions != null){
				$form = new Zend_Form;
				$form->setMethod('post');

				$parIDElement = new Zend_Form_Element_Hidden(
				'participantID', array('value' => $participantID));

				$questionnaireIDElement = new Zend_Form_Element_Hidden(
				'questionnaireID', array('value' => $participantID));

				$questionnaireIDElement = new Zend_Form_Element_Hidden(
				'questionnaireID', array('value' => $participantID));

				$courseElement = new Zend_Form_Element_Text(
				'course', array('label' => 'Studiengang:'));
				$courseElement->addFilter('StripTags');

				$semesterElement = new Zend_Form_Element_Multiselect(
				'semester', array('label' => 'Semester'));
				$semesterElement->setMultiOptions(array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14));

				$fixedElements = array($questionnaireIDElement,
									$parIDElement,
									$courseElement, 
									$semesterElement);
				$form->addElements($fixedElements);

				foreach($categoryQuestions as $question){
					$element;
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
		} else {
			echo "Keine Fragen ind der Kategorie des Fragebogens bekannt";
		}

	}

	private function getQuestionsToParID($parID){
		//Get participant
		$participants = $this->participantTable->find($parID);
		if (count($participants) > 0){
			$participant = $participants->current();
			//Get questionnaire to participant
			$questionnaires = $this->questionnaireTable->find($participant->questionnaireId);
			if (count($questionnaires) > 0){
				$questionnaire = $questionnaires->current();
				//Get all questions
				$allQuestions = $this->questionTable->fetchAll();
				$categoryQuestions = array();
				$i = 0;
				foreach($allQuestions as $question){
					//Sort out questions who are not in the same category as questionnaire
					if($question->category == $questionnaire->category){
						$categoryQuestions[$i]  = $question;
						$i = $i + 1;
					}
				}
				return $categoryQuestions;		
			}
		}
		return null;
	}

}

