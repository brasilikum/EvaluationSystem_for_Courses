<?php

class Admin_ProfController extends Zend_Controller_Action
{

	protected $answerToQuestionTable;
	protected $questionTable;
	protected $questionnaireTable;
	protected $userTable;


	public function init()
	{
		$this->answerToQuestionTable = new Application_Model_DbTable_AnswerToQuestionTable();
		$this->questionnaireTable = new Application_Model_DbTable_QuestionnaireTable();
		$this->questionTable = new Application_Model_DbTable_QuestionTable();
		$this->userTable = new Application_Model_DbTable_UserTable();
		
			
	}

	public function indexAction()
	{

		
		
			echo '<a  href=\' '. $this->view->baseUrl() . '/admin/prof/questionnaires\'>Umfragen</a></div><br/>';
			echo '<a  href=\' '. $this->view->baseUrl() . '/user/logout\'>Logout</a></div><br/>';
			
			
			

	}


	public function questionnairesAction()
	{

			echo 'Ihre getätigten Umfragen';
		
			$profId = Application_Plugin_auth_AccessControl::getUserId();
			$profRowset = $this->userTable->find($profId);
			$profRow = $profRowset->current();
			$questionnaires = $profRow->findDependentRowset('Application_Model_DbTable_QuestionnaireTable');

			$today = date("Y-m-d");

			echo 'Heute ist der';
			echo $today;

			foreach($questionnaires as $questionnaireFromProf){
				if($questionnaireFromProf->expirationDate >= $today){
				echo $questionnaireFromProf->courseName;
				echo $questionnaireFromProf->expirationDate;
			}
			}
			echo '<a  href=\' '. $this->view->baseUrl() . '/user/logout\'>Logout</a></div><br/>';
			
			
			

	}

	

	


}

