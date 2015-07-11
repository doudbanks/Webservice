<?php

class PlatformModel extends Model {
	public function getPlatformById($id) {
		$sql = "SELECT * from plateform where idPlateform = ?";
		
		$this->_setSql($sql);
		$data = $this->getRow(array($id));
		return $data['nom'];

	}

	public function getPlatformIdByName($name) {
		$sql = "SELECT * from plateform where Nom_Plateform LIKE ?";
		
		$this->_setSql($sql);
		$data = $this->getRow(array($name));
		if(empty($data)){
			$sql = "INSERT INTO `plateform`(`Nom_Plateform`) VALUES (?)";
			$this->_setSql($sql);				
			return $this->insert(array($name));
		}
		return $data['idPlateform'];
	}
}