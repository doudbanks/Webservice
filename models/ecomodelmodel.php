<?php

class EcoModelModel extends Model {

	public function getEcoModelsByInformationId($id) {
		$sql = "SELECT * from modeleeco where idInformation=?";
		
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
		$object = new EcoModel();
		$object->setId($data['idModeleEco']);
		$object->setName($data['Nom']);

		return $object;
	}

	public function isExisting($eco) {
		$sql = "SELECT * from modeleeco where Nom LIKE '" . $eco->getName() . "' AND idInformation = ".$eco->getIdInformation().";";
		
		$this->_setSql($sql);
		return $this->getRow();
	}

	public function insertEcoModel($eco) {

		$exist = $this->isExisting($eco);
		if(!$exist) {
			$sql = "INSERT INTO `modeleeco`(`idInformation`, `Nom`) VALUES (?, ?)";	
			$this->_setSql($sql);				
			return $this->insert(array($eco->getIdInformation(), $eco->getName()));
		} else {
			$exist['idModeleEco'];
		}
	}

}