<?php

class Application_Model_DbTable_QuestionnaireTable extends Zend_Db_Table_Abstract 
{
	protected $_name = 'questionnaire';
	protected $_dependentTables = array('Application_Model_DbTable_AnswerToQuestionTable','Application_Model_DbTable_ParticipantTable','Application_Model_DbTable_SubmittersTable');
	protected $_referenceMap = array(
		'User' => array(
			'columns'		=>	'profId',
			'refTableClass'	=>	'Application_Model_DbTable_UserTable',
			'refColums'		=>	'id',
			'onDelete'		=>	self::RESTRICT
			),

		'Professor' => array(
			'columns'		=>	'fullName',
			'refTableClass'	=>	'Application_Model_DbTable_UserTable',
			'refColums'		=>	'fullName',
			'onDelete'		=>	self::RESTRICT
			)

		);

	
	
}