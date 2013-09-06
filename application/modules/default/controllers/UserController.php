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



	public function _getLoginForm(){

	    $form = new Zend_Form();
		$form->setAction('')->setMethod('post');
		$username = new Zend_Form_Element_Text('username', array('label' => 'Benutzername', 'required' => true));
		$password = new Zend_Form_Element_Password('password', array('label' => 'Passwort', 'required' => true));
		$submit = new Zend_Form_Element_Submit('submit', array('label' => 'Anmelden'));
		$form->addElements(array($username, $password, $submit));

		return $form;

	}

}