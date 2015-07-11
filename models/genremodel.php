<?php

class GenreModel extends Model {

	public function getGenresByInformationId($id) {
		$sql = "SELECT * from genres where idInformation=?";
		
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
		$object = new Genre();
		$object->setId($data['idGenres']);
		$object->setName($data['Nom']);

		return $object;
	}

	public function isExisting($genre) {
		$sql = "SELECT * from genres where Nom LIKE '" . $genre->getName() ."' AND idInformation = ?;";
		
		$this->_setSql($sql);
		return $this->getRow(array($genre->getIdInformation()));
	}

	public function insertGenre($genre) {
		$exist = $this->isExisting($genre);
		if(!$exist) {
			$sql = "INSERT INTO `genres`(`idInformation`, `Nom`) VALUES (?, ?)";	
			$this->_setSql($sql);			
			return $this->insert(array($genre->getIdInformation(), $genre->getName()));
		} else {
			return $exist['idGenres'];
		}
	}
}