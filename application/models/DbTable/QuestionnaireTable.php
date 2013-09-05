<?php

class Application_Model_DbTable_QuestionnaireTable extends Zend_Db_Table_Abstract 
{
	protected $_name = 'questionnaire';
	protected $_dependentTables = array('Application_Model_DbTable_AnswerToQuestionTable');

	
	
}