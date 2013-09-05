<?php

class Default_IndexController extends Zend_Controller_Action
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

			$this->view->form = $this->_getLoginForm();

			

	}

	public function _getLoginForm(){

			$form = new Zend_Form();
			$form->setMethod(Zend_Form::METHOD_POST);
			$form->addElement('text', 'username', array(
					'label' => 'Benutzername'
				));
			$form->addElement('password', 'password', array(
					'label' => 'Passwort'
				))->addElement('submit','submit',array(
					'label' => 'login'
				));

				return $form;

	}


}

