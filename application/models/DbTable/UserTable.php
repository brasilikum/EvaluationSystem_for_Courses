<?php

class Application_Model_DbTable_UserTable extends Zend_Db_Table_Abstract 
{
	protected $_name = 'user';
	protected $_dependentTables = array('Application_Model_DbTable_QuestionnaireTable');
}