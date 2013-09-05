<?php

class Application_Model_DbTable_QuestionTable extends Zend_Db_Table_Abstract 
{
	protected $_name = 'question';
	protected $_dependentTables = array('Application_Model_DbTable_AnswerToQuestionTable');

	
	
}