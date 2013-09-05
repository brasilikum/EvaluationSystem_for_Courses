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
		$form = $this->generateForm();
		$participantID = null;
		$request = $this->getRequest();

		if ($request->isGet()){
			$participantID = (int)$request->getParam('id');
		}

		$participants = $this->participantTable->find($participantID);
		if (count($participants) > 0){
			$participant = $participants->current();
		}

		echo $participant->questionnaireId;

		//echo sha1(uniqid(mt_rand(), true));

		$this->view->form = $form;

		//zu participantID die entsprechende Evaluation suchen
		//entspechendes Formular aufbauen
	}

	private function generateForm()
	{
		$form = new Zend_Form;
		$form->setMethod('post');
		$nameElement = new Zend_Form_Element_Text(
		'name', array('label' => 'Name'));
		$nameElement->setRequired(true);
		$nameElement->addFilter('StripTags');

		$radioElement = new Zend_Form_Element_Radio(
		'radio', array('label' => 'Radio'));
		$radioElement->setMultiOptions(array(0 => 0, 1, 2, 3, 4));

		$submitElement = new Zend_Form_Element_Submit(
		'submit', array('label'=>'Speichern'));

		$elements = array($nameElement, 
							$radioElement, 
							$submitElement);

		$form->addElements($elements);

		return $form;
	}

}

