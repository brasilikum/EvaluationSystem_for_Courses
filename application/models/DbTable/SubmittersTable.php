<?php

class Application_Model_DbTable_SubmittersTable extends Zend_Db_Table_Abstract 
{
	protected $_name = 'submitters';
	protected $_referenceMap = array(
		'Answer' => array(
			'columns'		=>	'Answerhash',
			'refTableClass'	=>	'Application_Model_DbTable_AnswerToQuestionTable',
			'refColums'		=>	'answerhash',
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