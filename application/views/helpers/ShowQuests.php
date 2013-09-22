<?php
class Zend_View_Helper_ShowQuests extends Zend_View_Helper_Abstract{
	public function showQuests($quests = null){
		$today = date("Y-m-d");
		$html = '';
		if($quests != null){
			$html .= '<ul>';
			foreach($quests as $quest){
				if($questionnaireFromProf->expirationDate >= $today){
					$html .= '<li class=expired">';
				}else{
					$html .= '<li>';
				}
				$html .= '<h2>' .$quest->courseName .'</h2>';
				$html .= '<div>' .$quest->category .'</div>';
				$html .= '<div>' .$quest->expirationDate .'</div>';
				$html .= '</li>';
			}
			$html .= '</ul>';
		}else{
			$html .= 'Keine Umfragen getätigt';
		}
		return $html;
	}
}