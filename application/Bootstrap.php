<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
	protected $_appNamespace = 'Application';
    protected function _initDoctype()
    {
        $this->bootstrap('view');
        $view = $this->getResource('view');
        $view->doctype('XHTML1_STRICT');
        $view->addHelperPath(dirname(__FILE__) . '/views/helpers', 'My_View_Helper');        
    }

    protected function _initLanguage()
    {
    	$translator = new Zend_Translate(
        	array(
            	'adapter' => 'array',
            	'content' => APPLICATION_PATH . '/resources/languages',
            	'locale'  => 'de_DE',
            	'scan'    => Zend_Translate::LOCALE_DIRECTORY
        	)
    	);
    	Zend_Validate_Abstract::setDefaultTranslator($translator);
    }

              
   protected function _initAuth()
    {
        $this->bootstrap('frontController');
        $auth = Zend_Auth::getInstance();
        $acl = new Application_Plugin_Auth_Acl();
       $this->getResource('frontController')->registerPlugin(new Application_Plugin_Auth_AccessControl($auth, $acl))->setParam('auth', $auth);
    }
}

