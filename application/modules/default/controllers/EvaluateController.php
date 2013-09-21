<?php

class EvaluateController extends Zend_Controller_Action
{
	protected $answerToQuestionTable;
	protected $questionTable;
	protected $questionnaireTable;
	protected $participantTable;
	protected $submittersTable;
	protected $userTable;

	public function init(){
		$this->answerToQuestionTable = new Application_Model_DbTable_AnswerToQuestionTable();
		$this->questionnaireTable = new Application_Model_DbTable_QuestionnaireTable();
		$this->questionTable = new Application_Model_DbTable_QuestionTable();
		$this->participantTable = new Application_Model_DbTable_ParticipantTable();
		$this->submittersTable = new Application_Model_DbTable_SubmittersTable();
		$this->userTable = new Application_Model_DbTable_UserTable();
	}

	public function indexAction(){
	}

	public function evaluateAction(){
		$request = $this->getRequest();
		$participantID = null;		//Incoming ID per Link
		$participant = null;		//participant Object from DB
		$questionnaire = null;		//questionnaire Object from DB
		$categoryQuestions = array();
		//Incoming link from Email
		if ($request->isGet()){				
			$participantID = $request->getParam('id');
		//Save
		}else if ($request->isPost()){
			$participantID = $request->getParam('participantID');
		}
		//Is valid sha1
		if ((bool) preg_match('/^[0-9a-f]{40}$/i', $participantID)){
			$participants = $this->participantTable->find($participantID);
			if (count($participants) > 0){
				$participant = $participants->current();
				//Get questionnaire to participant
				$questionnaires = $this->questionnaireTable->find($participant->questionnaireId);
				if (count($questionnaires) > 0){
					$questionnaire = $questionnaires->current();
					$today = date("Y-m-d");
					//Check if questionnaire still running
					if($today > $questionnaire->expirationDate){
						$this->view->error = "Diese Evaluation ist beendet";
						return false;
					}
					$categoryQuestions = $this->questionTable->fetchAll($this->questionTable->select()
						->where('category = ?', $questionnaire->category)
						->order('prio DESC'));
					$form = $this->generateForm($participant->hash, $categoryQuestions);	
					if ($request->isGet()){
						$this->generateDescr($questionnaire);
						$this->view->form = $form;
					} else if ($request->isPost()){
						$answerhash = sha1(uniqid(mt_rand(), true));
						$form->populate($this->_request->getPost());
						foreach($categoryQuestions as $question){
							$answer = $this->answerToQuestionTable->createRow();
							$answer->questionId = $question->id;
							$answer->questionnaireId = $questionnaire->id;
							$answer->answerhash = $answerhash;
							if($question->type == "text" || $question->type == "tarea"){
								$answer->answertext = $form->getValue($question->id);
							} else if ($question->type == "radio"){
								$answer->answernumber = $form->getValue($question->id);
							} else if ($question->type == "musel"){
								$multiArray = $form->getElement($question->id)->getMultiOptions();
								$number = $form->getValue($question->id);
								$answer->answernumber = $multiArray[$number];
							}
							$answer->save();
						}
						$submitter = $this->submittersTable->createRow();
						$submitter->answerhash = $answerhash;
						$submitter->questionnaireId = $questionnaire->id;
						$submitter->save();
						$this->deleteParticipant($participant->hash);
						$this->view->formsaved = true;	
					}
				} else {	//(count($questionnaires) > 0)
					$this->view->error = "Fehler in der DB";
				}
			} else {	//(count($participants) > 0)
				$this->view->error = "Der Evaluationszeitraum ist beendet oder die Evaluation über diesen Link wurde bereits abgeschlossen";
			}
		} else {	//((bool) preg_match('/^[0-9a-f]{40}$/i', $participantID))
			$this->view->error = "No hash found or hash invalid";
		}				
	}

	private function generateDescr($questionnaire){
		$fullName = $this->userTable
							 ->fetchAll($this->userTable
							 ->select()
							 ->where('id = ?',$questionnaire->profId))
							 ->current()
							 ->fullName;
		$this->view->questName = $questionnaire->courseName;
		$this->view->questSemester = $questionnaire->semester;
		$this->view->profName = $fullName;
	}

	private function generateForm($participantID, $categoryQuestions){
		$form = new Zend_Form;
		$form->setMethod('post');
		foreach($categoryQuestions as $question){
			if($question->prio == 89){				
				$form->addElement('hidden', 'Lehrumgebung', array(
				    'description' => '<dt><h3>Die Lehrumgebung</h3></dt>',
				    'ignore' => true,
				    'decorators' => array(
				        array('Description', array('escape'=>false, 'tag'=>'')),
				    ),
				));
			}else if($question->prio == 79){
				$form->addElement('hidden', 'Waehend', array(
				    'description' => '<dt><h3>Wähend der Varanstaltung</h3></dt>',
				    'ignore' => true,
				    'decorators' => array(
				        array('Description', array('escape'=>false, 'tag'=>'')),
				    ),
				));
			}else if($question->prio == 69){
				$form->addElement('hidden', 'Aufbau', array(
				    'description' => '<dt><h3>Aufbau der Veranstaltung</h3></dt>',
				    'ignore' => true,
				    'decorators' => array(
				        array('Description', array('escape'=>false, 'tag'=>'')),
				    ),
				));
			}else if($question->prio == 59){
				$form->addElement('hidden', 'Nach', array(
				    'description' => '<dt><h3>Nach der Veranstaltung</h3></dt>',
				    'ignore' => true,
				    'decorators' => array(
				        array('Description', array('escape'=>false, 'tag'=>'')),
				    ),
				));
			}else if($question->prio == 9){
				$form->addElement('hidden', 'Fazit', array(
				    'description' => '<dt><h3>Fazit</h3></dt>',
				    'ignore' => true,
				    'decorators' => array(
				        array('Description', array('escape'=>false, 'tag'=>'')),
				    ),
				));
			}
			if($question->type == "radio"){
				$element = new Zend_Form_Element_Radio(
				$question->id, array('label' => $question->text));
				$element->setMultiOptions(array('1' => "Trifft zu", '2' => "Trifft meistens zu" , '3' => "Trifft teilweise zu", '4' => "Trifft selten zu" , '5' => "Trifft nicht zu", '0' => "keine Angabe"));
				$element->setValue(array(0));
			} else if($question->type == "musel"){
				$element = new Zend_Form_Element_Select(
				$question->id, array('label' => $question->text));
				$element->setMultiOptions(range($question->rangeMin, $question->rangeMax, $question->rangeStep));
			} else if($question->type == "text"){
				$element = new Zend_Form_Element_Text(
				$question->id, array('label' => $question->text));
				$element->addFilter('StripTags');
			} else if($question->type == "tarea"){
				$element = new Zend_Form_Element_Textarea(
				$question->id, array('label' => $question->text));
				$element->addFilter('StripTags');
			}
			$form->addElement($element, $question->id);
		}
		$parIDElement = new Zend_Form_Element_Hidden(
		'participantID', array('value' => $participantID));
		$submitElement = new Zend_Form_Element_Submit(
		'submit', array('label'=>'Speichern'));
		$elements = array($parIDElement, $submitElement);
		$form->addElements($elements);
		return $form;
	}

	private function deleteParticipant($participantID){
		$participants = $this->participantTable->find($participantID);
		$participant = $participants->current();
		$participant->delete();
		$participants = $this->participantTable->find($participantID);
		if(count($participants) > 0){
			return false;
		}
		return true;
	}
}