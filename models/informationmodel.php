<?php

class InformationModel extends Model {

	public function getInformationById($id) {
		$sql = "SELECT * FROM information WHERE idInformation = ?";
		
		$this->_setSql($sql);
		$data = $this->getRow(array($id));
		
		if (empty($data)) {
			return false;
		}
		
		return $this->fillObject($data);
	}

	// Méthode permettant de remplir un objet
	private function fillObject($data) {
		$object = new Information();
		$object->setId($data['idInformation']);
		$object->setName($data['Nom']);
		$object->setDescription($data['Description']);
		$object->setNbMaxPlayer($data['Nb_Max_Player']);
		$object->setClassification($data['Classification']);

		return $object;
	}

	public function isExisting($information) {
		$sql = "SELECT * from information where Nom LIKE '" . $information->getName() . "' AND Nb_Max_Player = ".$information->getNbMaxPlayer()." AND Description LIKE '".$information->getDescription()."' AND Classification LIKE '".$information->getClassification()."'";
		$this->_setSql($sql);
		return $this->getRow();
	}

	public function insertInformation($information) {
		$exist = $this->isExisting($information);
		if(!$exist) {
			$sql = "INSERT INTO `information`(`Nom`, `Nb_Max_Player`, `Description`, `Classification`) VALUES ('" . $information->getName() . "', ".$information->getNbMaxPlayer().", '".$information->getDescription()."', '".$information->getClassification()."')";
			$this->_setSql($sql);			
			return $this->insert();
		} else {
			return $exist['idInformation'];
		}
	}
}