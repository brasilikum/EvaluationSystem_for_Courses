<?php
class UserController extends Zend_Controller_Action
{

	protected $bookTable;
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

	public function logoutAction()
	{
		Zend_Auth::getInstance()->clearIdentity();
		$this->_redirect('default');
	}



	

}