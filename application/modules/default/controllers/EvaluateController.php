<?php

class EvaluateController extends Zend_Controller_Action
{

	protected $answerToQuestionTable;
	protected $questionTable;
	protected $questionnaireTable;


	public function init()
	{
		$this->answerToQuestionTable = new Application_Model_DbTable_AnswerToQuestionTable();
		$this->questionnaireTable = new Application_Model_DbTable_QuestionnaireTable();
		$this->questionTable = new Application_Model_DbTable_QuestionTable();
		
			
	}

	public function indexAction()
	{


	}

	public function evaluateAction()
	{
		$form = $this->generateForm();
		$evalID = null;
		$request = $this->getRequest();

		if ($request->isGet()){
			$evalID = (int)$request->getParam('id');
		}

		echo sha1(uniqid(mt_rand(), true));

		$this->view->form = $form;

		//zu evalID die entsprechende Evaluation suchen
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

