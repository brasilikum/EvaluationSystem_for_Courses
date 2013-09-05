<?php
class Application_Plugin_Auth_Acl extends Zend_Acl
{
	public function __construct()
	{ 
		//Pfad zur acl.ini setzen
        $this->_config = (string) APPLICATION_PATH."/configs/acl.ini";

        //Prüft ob die Config-Datei vorhanden ist
        if(file_exists($this->_config))
        {
            //Config einlesen und in ein Array packen
            $config = new Zend_config_Ini($this->_config);
            $config = $config->toArray();
 
            foreach ($config as $res=>$value)
            {
                //Hinzufügen der verfügbaren Resourcen
                $this->addResource(new Zend_Acl_Resource($res));
                foreach ($value as $role=>$access)
                {
                    if(!$this->_getRoleRegistry()->has($role))
                    {
                        //Hinzufügen der verfügbaren Rollen
                        $this->addRole(new Zend_Acl_Role($role));
                    }
                    foreach ($access as $rules)
                    {
                        /* Setzen der Zugriffsrechte:
                           Falls access auf all gesetzt wird, erlaube alles für die Resource,
                           ansonsten definierte Rollen aus acl.ini */
                        if($rules == 'all')
                        {
                            $this->allow($role, $res, null);
                        }
                        else
                        {
                            $this->allow($role, $res, $rules);
                        }
                    }
                }
            }
        }
        else
        {
            throw new Zend_Acl_Exception('Keine Config-Datei /../application/configs gefunden');
        }
    }
}
