<?php

class Application_Model_DbTable_ParticipantTable extends Zend_Db_Table_Abstract 
{
	protected $_name = 'participant';
	protected $_dependentTables = array('Application_Model_DbTable_QuestionnaireTable');
}