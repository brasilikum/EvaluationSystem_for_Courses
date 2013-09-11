<?php

class Application_Model_DbTable_ParticipantTable extends Zend_Db_Table_Abstract 
{
	protected $_name = 'participant';
	protected $_referenceMap = array(
		'Participant' => array(
			'columns'		=>	'questionnaireId',
			'refTableClass'	=>	'Application_Model_DbTable_QuestionnaireTable',
			'refColums'		=>	'id',
			'onDelete'		=>	self::RESTRICT
			)
		);
}