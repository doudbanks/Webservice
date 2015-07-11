<?php

class MediaModel extends Model {

	public function getMediasByGameId($id) {
		$sql = "SELECT * from JeuMedia 
		LEFT JOIN Media ON Media.idMedia = JeuMedia.idMedia 
		WHERE idJeu=?";
		
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

	public function getTypeMediasByMediaId($id) {
		$sql = "SELECT * from TypeMedia 
		WHERE idMedia=?";
		
		$this->_setSql($sql);
		$datas = $this->getAll(array($id));
		
		if (empty($datas)) {
			return false;
		}
		
		$array = array();

		foreach($datas as $data) {
			$object = $this->fillObjectTypeMedia($data);
			array_push($array, $object);
		}
		return $array;
	}

	public function getPlateformsByMediaId($id) {
		$sql = "SELECT * from plateform_media 
		LEFT JOIN Plateform ON plateform_media.idPlateform = Plateform.idPlateform 
		WHERE idMedia=?";
		
		$this->_setSql($sql);
		$datas = $this->getAll(array($id));
		
		if (empty($datas)) {
			return false;
		}
		
		$array = array();

		foreach($datas as $data) {
			$object = $this->fillObjectPlateform($data);
			array_push($array, $object);
		}
		return $array;
	}

	public function getTagsByMediaId($id) {
		$sql = "SELECT * from Tag 
		WHERE idMedia=?";
		
		$this->_setSql($sql);
		$datas = $this->getAll(array($id));
		
		if (empty($datas)) {
			return false;
		}
		
		$array = array();

		foreach($datas as $data) {
			$object = $this->fillObjectTag($data);
			array_push($array, $object);
		}
		return $array;
	}

	// Méthode permettant de remplir un objet
	private function fillObject($data) {
		$object = new Media();
		$object->setId($data['idMedia']);
		$object->setTitle($data['Titre']);
		$object->setLink($data['Lien']);
		$object->setDate($data['Date']);
		$object->setType($data['Type']);
		$object->setDescription($data['Description']);
		$object->setNbView($data['Nb_Vue']);

		$object->setPlateforms($this->getPlateformsByMediaId($data['idMedia']));
		$object->setTypeMedias($this->getTypeMediasByMediaId($data['idMedia']));
		$object->setTags($this->getTagsByMediaId($data['idMedia']));

		return $object;
	}

	private function fillObjectPlateform($data) {
		$object = new Platform();
		$object->setId($data['idPlateform']);
		$object->setName($data['Nom_Plateform']);

		return $object;
	}

	private function fillObjectTypeMedia($data) {
		$object = new TypeMedia();
		$object->setId($data['idTypeMedia']);
		$object->setIdMedia($data['idMedia']);
		$object->setType($data['Type']);
		$object->setDescription($data['Description']);

		return $object;
	}

	private function fillObjectTag($data) {
		$object = new Tag();
		$object->setId($data['idTag']);
		$object->setType($data['Type']);

		return $object;
	}

	public function insertGameMedia($media) {
		$idMedia = $this->insertMedia($media);

		$sql = "SELECT * from jeumedia where idMedia = ? AND idJeu = ?";
		
		$this->_setSql($sql);
		$data = $this->getRow(array($idMedia, $media->getIdGame()));
		if(!$data){
			$sql = "INSERT INTO `jeumedia` (`idMedia`, `idJeu`) VALUES (?, ?)";	
			$this->_setSql($sql);				
			return $this->insert(array($idMedia, $media->getIdGame()));
		}
		return $data['idJeuMedia'];

	}

	public function isExisting($media) {
		$sql = "SELECT * from media where Titre LIKE '" . $media->getTitle() . "' AND Lien LIKE '".$media->getLink()."' AND Date LIKE '".$media->getDate()."' AND Type LIKE '".$media->getType()."' AND Description LIKE '".$media->getDescription()."' AND Nb_Vue = ".$media->getNbView().";";
		$this->_setSql($sql);
		return $this->getRow();
	}

	public function insertMedia($media) {
		$exist = $this->isExisting($media);
		if(!$exist){
			$sql = "INSERT INTO `media`(`Titre`, `Lien`, `Date`, `Type`, `Description`, `Nb_Vue`) VALUES (?, ?, ?, ?, ?, ?)";					
			$this->_setSql($sql);
			return $this->insert(array($media->getTitle(), $media->getLink(), $media->getType(), $media->getDescription(), $media->getNbView()));
		} else {
			return $exist['idMedia'];
		}
	}
}