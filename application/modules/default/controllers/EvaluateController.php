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

	public function evaluateAction(){
		$evalID = null;
		$request = $this->getRequest();

		if ($request->isGet()){
			$evalID = (int)$request->getParam('evalid');
		}

		echo $evalID;

		//zu evalID die entsprechende Evaluation suchen
		//entspechendes Formular aufbauen
	}


}

