<?php
class Application_Plugin_Auth_AuthAdapter extends Zend_Auth_Adapter_DbTable 
{
	public function __construct()
	{
		$dbAdapter = Zend_Db_Table::getDefaultAdapter();
		parent::__construct($dbAdapter);
		$this->setTableName('user');
		$this->setIdentityColumn('username');
		$this->setCredentialColumn('password');
		//$this->setCredentialTreatment('SHA1'); 
	}
}
