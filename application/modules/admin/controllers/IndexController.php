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

		
		
		
			echo '<a  href=\' '. $this->view->baseUrl() . '/admin/logout\'>Logout</a></div><br/>';
			
			
			

	}

	public function logoutAction(){
		echo 'HUUUUUUI';

	 	$role = Zend_Auth::getInstance()->getIdentity();
	 	echo $role;
		Zend_Auth::getInstance()->clearIdentity();
		$this->_redirect('default');
	}

	


}

