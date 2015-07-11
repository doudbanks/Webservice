<?php

class RedactorModel extends Model {

	public function getRedactorsByOpinionId($id) {
		$sql = "SELECT * from redacteur where idOpinion=?";
		
		$this->_setSql($sql);
		$datas = $this->getAll(array($id));
		
		if (empty($datas)) {
			return false;
		}
		
		$array = array();

		foreach($datas as $data) {
			$object = $this->fillObject($data);
			array_push($array, $object);
		}
		return $array;
	}

	// Méthode permettant de remplir un objet
	private function fillObject($data) {
		$object = new Redactor();
		$object->setId($data['idRedacteur']);
		$object->setIdOpinion($data['idOpinion']);
		$object->setMark($data['NoteGlobal']);
		$object->setTester($data['Testeur']);
		$object->setText($data['Texte']);

		return $object;
	}

	public function isExisting($redactor) {
		$sql = "SELECT * from redacteur where idOpinion = " . $redactor->getIdOpinion() . " AND NoteGlobal = '".$redactor->getMark()."' AND Testeur LIKE '".$redactor->getTester()."' AND Texte LIKE '".$redactor->getText()."';";
		
		$this->_setSql($sql);
		return $this->getRow();
	}

	public function insertRedactor($redactor) {

		$exist = $this->isExisting($redactor);
		if(!$exist){
			$sql = "INSERT INTO `redacteur`(`idOpinion`, `NoteGlobal`, `Testeur`, `Texte`) VALUES (?, ?, ?, ?)";					
			$this->_setSql($sql);
			return $this->insert(array($redactor->getIdOpinion(), $redactor->getMark(), $redactor->getTester(), $redactor->getText()));
		} else {
			return $exist['idRedacteur'];
		}
	}
}