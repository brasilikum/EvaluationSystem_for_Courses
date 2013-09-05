<?php

class Admin_IndexController extends Zend_Controller_Action
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

		if(Application_Plugin_auth_AccessControl::getUserRole()=='admin'){
		
		
		
			echo '<a  href=\' '. $this->view->baseUrl() . '/admin/logout\'>Logout</a></div><br/>';
		}	
			
		Zend_Auth::getInstance()->clearIdentity();
		$this->_redirect('default/index');
			

	}

	public function logoutAction(){


		Zend_Auth::getInstance()->clearIdentity();
		$this->_redirect('default/index');
	}

	


}

