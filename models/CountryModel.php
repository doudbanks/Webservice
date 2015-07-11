<?php

class CountryModel extends Model {
	public function getCountryById($id) {
		$sql = "SELECT * from pays where idPays = ?";
		
		$this->_setSql($sql);
		$data = $this->getRow(array($id));
		return $data['nom'];

	}

	public function getCountryIdByName($name) {
		$sql = "SELECT * from pays where Nom LIKE ?";
		
		$this->_setSql($sql);
		$data = $this->getRow(array($name));
		if(!$data){
			$sql = "INSERT INTO `pays`(`Nom`) VALUES (?)";	
			$this->_setSql($sql);				
			return $this->insert(array($name));
		}
		return $data['idPays'];
	}
}