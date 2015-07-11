<?php

class GameModel extends Model {

	public function getAllGames() {
		$sql = "SELECT * FROM jeu WHERE active = 1;";
		
		$this->_setSql($sql);
		$datas = $this->getAll();
		
		if (empty($datas)) {
			return false;
		}
		
		$array = array();

		foreach($datas as $data) {
			$game = $this->fillObject($data);
			array_push($array, $game);
		}
		return $array;
	}
	
	public function getGameById($id) {
		$sql = "SELECT * FROM jeu WHERE idJeu = ?";
		
		$this->_setSql($sql);
		$data = $this->getRow(array($id));

		$game = $this->fillObject($data);

		if (empty($game)) {
			return false;
		}
		
		return $game;
	}

	public function deleteGame($id) {
		$sql = "UPDATE `jeu` SET `active` = '0' WHERE `idJeu` = ? ;";
		
		$this->_setSql($sql);
		$result = $this->execute(array($id));

		return $result;
	}

	public function realDeleteGameByName($name) {
		$sql = "DELETE `jeu` FROM `jeu` LEFT JOIN information ON jeu.idInformation = information.idInformation WHERE information.Nom = '".$name."'";					
		$this->_setSql($sql);
		$result =  $this->execute();

		return 1;
	}

	// Méthode permettant de remplir un objet
	private function fillObject($data) {
		$game = new Game();
		$game->setId($data['idJeu']);
		$game->setIdInformation($data['idInformation']);
		$game->setIsActive($data['active']);

		return $game;
	}

	public function isExisting($game) {
		$sql = "SELECT * from jeu where active = " . $game->isActive() . " AND idInformation = ".$game->getIdInformation() .";";
		$this->_setSql($sql);
		return $this->getRow();
	}

	public function insertGame($game) {
		$exist = $this->isExisting($game);
		if(!$exist) {
			$sql = "INSERT INTO `jeu`(`idInformation`, `active`) VALUES (?, ?)";
			$this->_setSql($sql);				
			return $this->insert(array($game->getIdInformation(), $game->isActive()));
		} else {
			return $exist['idJeu'];
		}
	}
}