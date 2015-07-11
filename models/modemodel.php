<?php

class ModeModel extends Model {

	public function getModesByInformationId($id) {
		$sql = "SELECT * from modes where idInformation=?";
		
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
		$object = new Theme();
		$object->setId($data['idModes']);
		$object->setName($data['Nom']);

		return $object;
	}

	public function isExisting($mode) {
		$sql = "SELECT * from modes where idInformation = " . $mode->getIdInformation() . " AND Nom LIKE '".$mode->getName()."';";
		
		$this->_setSql($sql);
		return $this->getRow();
	}

	public function insertMode($mode) {
		$exist = $this->isExisting($mode);
		if(!$exist){
			$sql = "INSERT INTO `modes`(`idInformation`, `Nom`) VALUES (?, ?)";					
			$this->_setSql($sql);
			return $this->insert(array($mode->getIdInformation(), $mode->getName()));
		} else {
			return $exist['idModes'];
		}
	}
}