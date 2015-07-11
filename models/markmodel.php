<?php

class MarkModel extends Model {

	public function getMarksByTestId($id) {
		$sql = "SELECT * from note where idTest=?";
		
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
		$object = new Mark();
		$object->setId($data['idNote']);
		$object->setType($data['Type']);
		$object->setValue($data['Valeur']);
		$object->setContent($data['Content']);

		return $object;
	}

	public function isExisting($mark) {
		$sql = "SELECT * from note where Type LIKE '" . $mark->getType() . "' AND Valeur = ".$mark->getValue()." AND Content LIKE '".$mark->getContent()."' AND idTest = ".$mark->getIdTest().";";
		
		$this->_setSql($sql);
		$result = $this->getRow();
		return $result;
	}

	public function insertMark($mark) {
		$exist = $this->isExisting($mark);
		if(!$exist){
			$sql = "INSERT INTO `note` (`Type`, `Valeur`, `Content`, `idTest`) VALUES (?, ?, ?, ?)";					
			$this->_setSql($sql);
			return $this->insert(array($mark->getType(), $mark->getValue(), $mark->getContent(), $mark->getIdTest()));
		} else {
			return $exist['idNote'];
		}
	}
}