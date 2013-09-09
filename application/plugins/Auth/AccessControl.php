<?php
class Application_Plugin_Auth_AccessControl extends Zend_Controller_Plugin_Abstract
{
	private $_auth = null;
	private $_acl = null;
	public function __construct(Zend_Auth $auth, Zend_Acl $acl)
	{
		//Variablen Initialisieren
		$this->_auth = $auth;
		$this->_acl  = $acl;
	}

	
	public static function getUserRole()
	{
		try
		{
			if (isset(Zend_Auth::getInstance()->getStorage()->read()->role))
			{
				$role = Zend_Auth::getInstance()->getStorage()->read()->role;
			}
			else
			{
				$role = 'guest';
			}
		}
		catch(Exeption $e)
		{
			$role = 'guest';
		}
		return $role;
	}
	
	public static function getUserId()
		{
			try
			{
				if (isset(Zend_Auth::getInstance()->getStorage()->read()->id))
				{
					$userId = Zend_Auth::getInstance()->getStorage()->read()->id;
				}
				else
				{
					$userId = null;
				}
			}
			catch(Exeption $e)
			{
					$userId = null;
			}
				
			return $userId;
		}


	public function routeStartup(Zend_Controller_Request_Abstract $request)
	{	
		//exestiert schon ein User oder ist etwas im get oder post übergeben
		if (!$this->_auth->hasIdentity()
			&& null !== $request->getPost('username')
			&& null !== $request->getPost('password')){	

			//$view = $registry->view;
			$filter = new Zend_Filter_StripTags();
			$username = $filter->filter($request->getPost('username'));
			$password = $filter->filter($request->getPost('password'));
			if (empty($username)) 
			{
				$message = 'Bitte Benutzernamen angeben.';
			} 
			elseif (empty($password)) 
			{
				$message = 'Bitte Passwort angeben.';
			} 
			else 
			{ 
				$authAdapter = new Application_Plugin_Auth_AuthAdapter();
				$authAdapter->setIdentity($username);
				$authAdapter->setCredential($password);
				$result = $this->_auth->authenticate($authAdapter);
				if (!$result->isValid() ) 
				{ 
					$messages = $result->getMessages();
					$message = $messages[0];
				}else 
				{
					#speicherung in der Datenbank
					$storage = $this->_auth->getStorage();
        			$storage->write($authAdapter->getResultRowObject(null, 'password'));
        			if(Application_Plugin_auth_AccessControl::getUserRole() == 'admin'){
        				Zend_Controller_Action_HelperBroker::getStaticHelper('Redirector')->gotoUrl('admin/prof');
        			}
        			if(Application_Plugin_auth_AccessControl::getUserRole() == 'user'){
        				Zend_Controller_Action_HelperBroker::getStaticHelper('Redirector')->gotoUrl('admin/secretary');
        			}

				}

				$registry = Zend_Registry::getInstance();
				
			}

			if (isset($message)) 
			{ 
				echo $message;
			}
		}
	}

	#rolle holen, wenn nicht funktioniert ist die Rolle = Gast
	public function preDispatch(Zend_Controller_Request_Abstract $request)
	{ 
	
		if ($this->_auth->hasIdentity() &&is_object($this->_auth->getIdentity())) 
		{
			$role = $this->_auth->getIdentity()->role;
		} 
		else 
		{
			$role = 'guest';
		}
		$module = $request->getModuleName();
		$controller =$module.'_'.$request->getControllerName();
		$action = $request->getActionName();
		
		/*if (!$this->_acl->has($controller)) 
		{
			$controller = 'default_index';
		}*/

		#hier prüfung ob benutzer das machen darf
		if (!$this->_acl->isAllowed($role, $controller, $action)) 
		{ 
			
				$request->setModuleName('default');
				$request->setControllerName('index');
				$request->setActionName('index');
			
		}     
	}


}