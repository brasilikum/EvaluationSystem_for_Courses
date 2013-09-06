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

	public function indexAction()
	{


	}

	public function evaluateAction()
	{
		$participantID = null;
		$request = $this->getRequest();

		if ($request->isGet()){
			$participantID = (int)$request->getParam('id');
		}

		//Get participant
		$participants = $this->participantTable->find($participantID);
		if (count($participants) > 0){
			$participant = $participants->current();
			//Get questionaire to participant
			$questionnaires = $this->questionnaireTable->find($participant->questionnaireId);
			if (count($questionnaires) > 0){
				$questionnaire = $questionnaires->current();
				//Get all questions
				$allQuestions = $this->questionTable->fetchAll();
				$categoryQuestions = array();
				$i = 0;
				foreach($allQuestions as $question){
					//Sort out questions who are not in the same category as questionaire
					if($question->category == $questionnaire->category){
						$categoryQuestions[$i]  = $question;
						$i = $i + 1;
					}
				}
				$this->view->form = $this->generateForm($categoryQuestions);
			}
		}else{
			echo "Dieser Link ist ungültig oder die Evaluation über diesen Link wurde bereits abgeschlossen";
		}
		/*$participant->questionnaireId;

		//echo sha1(uniqid(mt_rand(), true));
		
		$form = $this->generateForm();
		$this->view->form = $form;

		//zu participantID die entsprechende Evaluation suchen
		//entspechendes Formular aufbauen*/
	}

	private function generateForm($categoryQuestions = null)	{
		if($categoryQuestions != null) {
			$form = new Zend_Form;
			$form->setMethod('post');

			$courseElement = new Zend_Form_Element_Text(
			'course', array('label' => 'Studiengang:'));
			$courseElement->addFilter('StripTags');

			$semesterElement = new Zend_Form_Element_Radio(
			'semester', array('label' => 'Semester'));
			$semesterElement->setMultiOptions(array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14));

			$fixedElements = array($courseElement, 
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

			

			return $form;
		} else {
			echo "Keine Fragen ind der Kategorie des Fragebogens bekannt";
		}
	}

}

