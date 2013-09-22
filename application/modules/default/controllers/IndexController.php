<?php

class IndexController extends Zend_Controller_Action
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
			if(Application_Plugin_auth_AccessControl::getUserRole()){
				if(Application_Plugin_auth_AccessControl::getUserRole() == 'user'){
					$this->_redirect('/admin/secretary/index');
				}
				if(Application_Plugin_auth_AccessControl::getUserRole() == 'admin'){
					$this->_redirect('/admin/prof/index');
				}
			}
			$this->view->form = $this->_getLoginForm();

			

	}

	public function _getLoginForm(){

	    $form = new Zend_Form();
		$form->setAction('')->setMethod('post');
		$username = new Zend_Form_Element_Text('username', array( 'required' => true));
		$username->setValue('Benutzername');
		$password = new Zend_Form_Element_Password('password', array( 'required' => true));
		$password->setValue('Passwort');
		$submit = new Zend_Form_Element_Submit('submit', array('label' => 'Anmelden'));
		$submit->setAttrib('id', 'loginSubmit');
		$form->addElements(array($username, $password, $submit));
		$form->password->renderPassword = 'true' ;

		return $form;

	}


}

