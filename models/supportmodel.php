<?php

class SupportModel extends Model {

	public function getSupportsByInformationId($id) {
		$sql = "SELECT * from supports where idInformation=?";
		
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
		$object = new Support();
		$object->setId($data['idSupports']);
		$object->setName($data['Nom']);

		return $object;
	}

	public function isExisting($support) {
		$sql = "SELECT * from supports where idInformation = " . $support->getIdInformation() . " AND Nom = '".$support->getName()."';";
		
		$this->_setSql($sql);
		return $this->getRow();
	}

	public function insertSupport($support) {
		$exist = $this->isExisting($support);
		if(!$exist){
			$sql = "INSERT INTO `supports`(`idInformation`, `Nom`) VALUES (?, ?)";					
			$this->_setSql($sql);
			return $this->insert(array($support->getIdInformation(), $support->getName()));
		} else {
			return $exist['idSupports'];
		}
	}
}