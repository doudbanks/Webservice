<?php

class OpinionModel extends model {

	public function getOpinionsByGameId($id) {
		$sql = "SELECT * from Opinion where idJeu=?";
		
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
		$object = new Opinion();
		$object->setId($data['idOpinion']);
		$object->setIdGame($data['idJeu']);
		$object->setType($data['Type']);

		return $object;
	}

	public function isExisting($opinion) {
		$sql = "SELECT * from opinion where idJeu = " . $opinion->getIdGame() . " AND Type = '".$opinion->getType()."';";
		
		$this->_setSql($sql);
		return $this->getRow();
	}

	public function insertOpinion($opinion) {
		$exist = $this->isExisting($opinion);
		if(!$exist){
			$sql = "INSERT INTO `opinion`(`idJeu`, `Type`) VALUES (?, ?)";					
			$this->_setSql($sql);
			return $this->insert(array($opinion->getIdGame(), $opinion->getType()));
		} else {
			return $exist['idOpinion'];
		}
	}
}