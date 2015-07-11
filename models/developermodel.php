<?php

class DeveloperModel extends Model {

	public function getDevelopersByInformationId($id) {
		$sql = "SELECT * from developpeur where idInformation=?";
		
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
		$object = new Developer();
		$object->setId($data['idDeveloppeur']);
		$object->setName($data['Nom']);

		return $object;
	}

	public function isExisting($dev) {
		$sql = "SELECT * from Developpeur where Nom LIKE '" . $dev->getName() . "' AND idInformation = ".$dev->getIdInformation();
		
		$this->_setSql($sql);
		return $this->getRow();
	}

	public function insertDeveloper($dev) {
		$exist = $this->isExisting($dev);
		if(!$exist){
			$sql = "INSERT INTO `developpeur`(`Nom`, `idInformation`) VALUES ( ?, ?)";
			$this->_setSql($sql);	
			return $this->insert(array($dev->getName(), $dev->getIdInformation()));	
		} else {
			return $exist['idDeveloppeur'];
		}
	}
}