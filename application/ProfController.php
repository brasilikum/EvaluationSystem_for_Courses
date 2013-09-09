<?php

class Admin_ProfController extends Zend_Controller_Action
{

	protected $answerToQuestionTable;
	protected $questionTable;
	protected $questionnaireTable;
	protected $userTable;


	public function init()
	{
		$this->answerToQuestionTable = new Application_Model_DbTable_AnswerToQuestionTable();
		$this->questionnaireTable = new Application_Model_DbTable_QuestionnaireTable();
		$this->questionTable = new Application_Model_DbTable_QuestionTable();
		$this->userTable = new Application_Model_DbTable_UserTable();
		
			
	}

	public function indexAction()
	{

		
		
			echo '<a  href=\' '. $this->view->baseUrl() . '/admin/prof/questionnaires\'>Umfragen</a></div><br/>';
			echo '<a  href=\' '. $this->view->baseUrl() . '/user/logout\'>Logout</a></div><br/>';
			
			
			

	}


	public function questionnairesAction()
	{

			echo 'Ihre getätigten Umfragen';
		
			//getting UserId and its denpendant rows
			$profId = Application_Plugin_auth_AccessControl::getUserId();
			$profRowset = $this->userTable->find($profId);
			$profRow = $profRowset->current();
			$questionnaires = $profRow->findDependentRowset('Application_Model_DbTable_QuestionnaireTable');

			$today = date("Y-m-d");

			//questionnaires from logged-in User are displayed
			foreach($questionnaires as $questionnaireFromProf){
				if($questionnaireFromProf->expirationDate >= $today){
				echo $questionnaireFromProf->courseName;
				echo $questionnaireFromProf->expirationDate;
			}
			}

			echo '<a  href=\' '. $this->view->baseUrl() . '/admin/prof/create\'>Neue Umfrage erstellen</a></div><br/>';
			echo '<a  href=\' '. $this->view->baseUrl() . '/user/logout\'>Logout</a></div><br/>';
			
			
			

	}

	public function createAction()
	{
		$form = $this->_getCreationForm();
		$request = $this->getRequest();

		if ($request->isPost())
		{
			if ($form->isValid($_POST))
			{
				$newQuestionnaire = $this->questionnaireTable->createRow();

				$newQuestionnaire->courseName = $form->getValue('courseName');
				$newQuestionnaire->expirationDate = $form->getValue('expirationDate');
				$newQuestionnaire->semester = $form->getValue('semester');
				$newQuestionnaire->category = $form->getValue('category');
				$newQuestionnaire->profId = Application_Plugin_auth_AccessControl::getUserId();
				

				$newQuestionnaire->save();

				echo 'Es hat geklappt!';

				$this->_redirect('/admin/prof/questionnaires');
			}
		}	

			$this->view->form = $this->_getCreationForm();
			
			echo '<a  href=\' '. $this->view->baseUrl() . '/admin/prof/questionnaires\'>abbrechen</a></div><br/>';
			echo '<a  href=\' '. $this->view->baseUrl() . '/user/logout\'>Logout</a></div><br/>';
			
			$this->view->form = $form;
			

	}

	public function _getCreationForm(){

	    $form = new Zend_Form();
		$form->setMethod('post');

		$expirationDate = new Zend_Form_Element_Text('expirationDate',array('label' => 'ReleaseDate', 'required' => true));
		$expirationDate->addFilter('StripTags');
		$expirationDate->addValidator(new Zend_Validate_Date);

		$courseName = new Zend_Form_Element_Text('courseName', array('label' => 'Modulname', 'required' => true));

		$semester = new Zend_Form_Element_Text('semester', array('label' => 'Semester', 'required' => true));


		$category = new Zend_Form_Element_Text('category', array('label' => 'VL oder PR', 'required' => true));
		

		$submit = new Zend_Form_Element_Submit('submit', array('label' => 'Abschicken'));
		$form->addElements(array($courseName, $semester, $category,$expirationDate, $submit));

		return $form;

	}

	

	


}

