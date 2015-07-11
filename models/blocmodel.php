<?php

class BlocModel extends Model {

	public function getBlocsByTestId($id) {
		$sql = "SELECT * from bloc where idTest=?";
		
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
		$object = new Bloc();
		$object->setId($data['idBloc']);
		$object->setType($data['Type']);
		$object->setTitle($data['Titre']);
		$object->setContent($data['Content']);

		return $object;
	}

	public function isExisting($bloc) {
		$sql = "SELECT * from bloc where Type LIKE '" . $bloc->getType() . "' AND Titre LIKE ".$bloc->getTitle() . "' AND content LIKE ".$bloc->getContent() . "' AND idTest = ".$bloc->getIdTest();
		
		$this->_setSql($sql);
		return $this->getRow();
	}

	public function insertBloc($bloc) {
		$exist = $this->isExisting($bloc);
		if(!$exist){
			$sql = "INSERT INTO `bloc` (`Type`, `Titre`, `content`, `idTest`) VALUES ( ?, ?, ?, ?)";
			$this->_setSql($sql);	
			return $this->insert(array($bloc->getType(), $bloc->getTitle(), $bloc->getContent(), $bloc->getIdTest()));	
		} else {
			return $exist['idBloc'];
		}
	}
}