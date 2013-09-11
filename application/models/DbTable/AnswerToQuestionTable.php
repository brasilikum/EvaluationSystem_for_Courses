<?php
class Application_Model_DbTable_AnswerToQuestionTable extends Zend_Db_Table_Abstract 
{
	protected $_name = 'answertoquestion';
	protected $_primary = 'id';
	protected $_dependentTables = array('Application_Model_DbTable_SubmittersTable');
	protected $_referenceMap = array(
		'Question' => array(
			'columns'		=>	'questionId',
			'refTableClass'	=>	'Application_Model_DbTable_QuestionTable',
			'refColums'		=>	'id',
			'onDelete'		=>	self::CASCADE
			),
		'Questionnaire' => array(
			'columns'		=>	'questionnaireId',
			'refTableClass'	=>	'Application_Model_DbTable_QuestionnaireTable',
			'refColums'		=>	'id',
			'onDelete'		=>	self::CASCADE
		)
	);
}