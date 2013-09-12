<?php

class Admin_SecretaryController extends Zend_Controller_Action
{

	protected $answerToQuestionTable;
	protected $questionTable;
	protected $questionnaireTable;
	protected $userTable;
	protected $submittersTable;


	//initiating database
	public function init()
	{
		$this->answerToQuestionTable = new Application_Model_DbTable_AnswerToQuestionTable();
		$this->questionnaireTable = new Application_Model_DbTable_QuestionnaireTable();
		$this->questionTable = new Application_Model_DbTable_QuestionTable();
		$this->userTable = new Application_Model_DbTable_UserTable();
		$this->submittersTable = new Application_Model_DbTable_SubmittersTable();
		
			
	}

	public function indexAction()
	{

		
			echo '<a  href=\' '. $this->view->baseUrl() . '/admin/secretary/questionnaires\'> laufende Umfragen anzeigen</a></div><br/>';
			echo '<a  href=\' '. $this->view->baseUrl() . '/user/logout\'>Logout</a></div><br/>';
			
			
			

	}

	//displaying all questionnaires
	public function questionnairesAction()
	{

			echo 'Fertige Umfragen';
		
			//getting UserId and its denpendant rows
	
			$questionnaires = $this->questionnaireTable->fetchAll();
			$today = date("Y-m-d");
			$denpendantProfId;
			$denpendantProfSet;
			$denpendantProf;

			//all questionnaires are displayed
			foreach($questionnaires as $questionnaire){
				if($questionnaire->expirationDate < $today){
					$denpendantProfId =  $questionnaire->profId;
					$denpendantProfSet = $this->userTable->find($denpendantProfId);
					$denpendantProf = $denpendantProfSet->current();
					echo $denpendantProf->username;
					echo $questionnaire->courseName;
					echo '('. $questionnaire->category. ')';
					echo $questionnaire->expirationDate;
					echo '<a  href=\' '. $this->view->baseUrl() . '/admin/secretary/show?id='.$questionnaire->id.'\'>Antworten anzeigen</a></div><br/>';
					echo '<a  href=\' '. $this->view->baseUrl() . '/admin/secretary/csv?id='.$questionnaire->id.'\'>Ergebnisse als CSV herunterladen</a></div><br/>';
					echo'<a onClick="return confirm(\'Wirklich l&ouml;schen?\');" href="'.$this->view->baseUrl().'/admin/secretary/delete?id='.$questionnaire->id.'">l&ouml;schen!</a><br/>';


				}

			
			}

			echo '<a  href=\' '. $this->view->baseUrl() . '/user/logout\'>Logout</a></div><br/>';


	}

	//deleting a questionnaire
	public function deleteAction()
	{
		$id = $this->getRequest()->getParam('id');


		$where = $this->questionnaireTable->find($id);
		$row = $where->current();


			
		$row->delete();		

		$this->_redirect('/admin/secretary/questionnaires');
			

	}

	//a function that displays questionnaires which are finished
	public function showAction()
	{

			$id = $this->getRequest()->getParam('id');

			$where = $this->questionnaireTable->find($id);
			$row = $where->current();

			$answersToQuestion = $row->findDependentRowset('Application_Model_DbTable_AnswerToQuestionTable');
			$questions = $this->questionTable->fetchAll();

			foreach ($questions as $question) {
				if($question->category == $row->category){
					if($question->type == 'radio' || $question->type == 'musel'){
						$counter = 0;
						$value = 0;
					}
					echo '<h3>'.$question->text.'</h3>';
					foreach ($answersToQuestion as $answerToQuestion) {	
						if($answerToQuestion->questionId == $question->id){
							if($answerToQuestion->answertext){
								if($answerToQuestion->questionId == 82 || $answerToQuestion->questionId == 96){
									echo $answerToQuestion->answertext.' ('.')';
								}else{echo $answerToQuestion->answertext;}
							}else{
								if($answerToQuestion->answernumber > 0){
								$counter++;
								$value = $value + $answerToQuestion->answernumber;
								}
							}
						}	
					 }
					 if($counter > 0){
					 	$value = $value/$counter;
					 	echo 'Durchschnitt: '.$value.'';
					 }
			}
		}
			
			
			echo '<a  href=\' '. $this->view->baseUrl() . '/admin/secretary/questionnaires\'>zurück</a></div><br/>';
			echo '<a  href=\' '. $this->view->baseUrl() . '/user/logout\'>Logout</a></div><br/>';
			
			
			

	}

	//writes the results of a questionnaire into a csv-file
	public function csvAction()
	{	
		//reading id of the questionnaire, which is supposed to be written into the file
		$questionnaireId = $this->getRequest()->getParam('id');

		//innitiating the arrays for the particular csv lines
		$csvColumn = array();
		$csvRowLabels = array();
		$qestionIds = array();
		$columnCounter = 0;
		$csvRowCounter = 0;


		//returning the actual questionnaire
		$questionnaire = $this->questionnaireTable
			     					  ->find($questionnaireId)
			     					  ->current();

		//returning the questions of the given questionnaire
		$categoryQuestions = $this->questionTable
								  ->fetchAll($this->questionTable->select()
							      ->where('category = ?', $questionnaire->category)
						          ->order('prio DESC'));


		//returning the answerhashes in order to iterate
		$submitters =  $this->submittersTable
						    ->fetchAll($this->submittersTable->select()
	     				    ->where('questionnaireId = ?', $questionnaireId));

		/*//saving non-categorical questions
		$questionIds[0] = 1;
		$questionIds[1] = 2;
		$questionIds[2] = 3;

		while($csvRowCounter<=2){
				 $csvRowLabels[$csvRowCounter] = $this->questionTable
				 									  ->find($questionIds[$csvRowCounter])
				 									  ->current()->text;							  
				 $csvRowCounter++;									  
				}*/

		//writing first csv-line
		foreach($categoryQuestions as $question){
			$questionIds[$csvRowCounter] = $question->id;
			$csvRowLabels[$csvRowCounter] = $question->text;
			$csvRowCounter++;
		}
		$csvColumn[$csvRowCounter] = $csvRowLabels;
		$columnCounter++;


		//writing csv-lines from answers
		foreach ($submitters as $submitter) {
			$answers = array();
			$csvRowCounter = 0;
			echo $submitter->answerhash;
			//returning the answers from current submitter
			$submitterAnswers = $this->answerToQuestionTable
								  ->fetchAll($this->answerToQuestionTable->select()
							      ->where('answerhash = ?', $submitter->answerhash));
			//iterating through questions in order to give the right answer to the right question
			foreach ($questionIds as $id) {
						foreach ($submitterAnswers as $answer) {
						      	if($answer->questionId == $id){
						      		if($answer->answertext){
						      			$answers[$csvRowCounter] = $answer->answertext;
						      		}else{
						      			$answers[$csvRowCounter] = $answer->answernumber;
						      		}
						      		$csvRowCounter++;
						      	}
						}  	
			 }

			 $csvColumn[$columnCounter] = $answers;
			 $columnCounter++;	 				      
		}


		$fp = fopen($questionnaire->courseName.'.csv', 'w');

		//writing the csv-file
		foreach ($csvColumn as $fields) {
   			 fputcsv($fp, $fields);
		}

		fclose($fp);


		$this->_redirect('/admin/secretary/questionnaires');
			

	}

}

