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
		$this->view->entries = $this->answerToQuestionTable->fetchAll();

		$rowset = $this->answerToQuestionTable->fetchAll();

		$count = count($rowset);

		echo $count;

			$row = $this->questionTable->find(1);

			echo count($row);

			$parent = $row->findDependentRowset('Application_Model_DbTable_AnswerToQuestionTable');

			echo $parent->text;

	}


}

