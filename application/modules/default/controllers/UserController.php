<?php
class UserController extends Zend_Controller_Action
{

	public function init()
	{
		
	}

	public function indexAction()

	{
		$this->view->form = $this->_getLoginForm();
		$this->_redirect('default');

	}


	public function loginAction()
	{
		
	}

	//clears the current session id
	public function logoutAction()
	{
		Zend_Auth::getInstance()->clearIdentity();
		$this->_redirect('default');
	}



	

}