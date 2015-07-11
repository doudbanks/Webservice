<?php

class TestModel extends Model {

	public function getTestsByGameId($id) {
		$sql = "SELECT * from Test 
				LEFT JOIN Entete ON Entete.idEntete = Test.idEntete
				LEFT JOIN Auteur ON Auteur.idAuteur = Entete.idAuteur
				LEFT JOIN Image ON Image.idImage = Entete.IdImage
				LEFT JOIN Plateform ON Plateform.idPlateform = Test.IdPlateform
				WHERE Test.idJeu= ? ;";
		
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
		$object = new Test();
		$object->setId($data['idJeu']);
		$object->setPublicationDate($data['Date_Publication']);
		$object->setType($data['Type']);

		//On initialise l'objet Header
		$header = new Header();
		$header->setId($data['idEntete']);
		$header->setLink($data['Lien']);
		$header->setTitle($data['Titre']);
		$header->setResume($data['Resume']);

		$author = new Author();
		$author->setId($data['idAuteur']);
		$author->setFunction($data['Fonction']);
		$author->setDescription($data['Description']);
		//On ajoute l'objet author à l'onjet header
		$header->setAuthor($author);

		$image = new Image();
		$image->setId($data['idImage']);
		$image->setFormat($data['Format']);
		$image->setLink($data['Lien_Image']);
		//On ajoute l'objet image à l'onjet header
		$header->setImage($image);

		//On ajoute l'objet header à l'onjet Test
		$object->setHeader($header);

		$plateform = new Platform();
		$plateform->setId($data['idPlateform']);
		$plateform->setName($data['Nom_Plateform']);

		$object->setPlateform($plateform);

		return $object;
	}

	public function getAuthor($author) {
		$sql = "SELECT * from auteur where Description LIKE ?;";
		
		$this->_setSql($sql);
		$data = $this->getRow(array($author->getDescription()));
		if(!$data){
			$sql = "INSERT INTO `auteur`(`Description`, `Fonction`) VALUES (?, ?)";	
			$this->_setSql($sql);				
			return $this->insert(array($author->getDescription(), $author->getFunction()));
		}
		return $data['idAuteur'];
	}

	public function getImage($image) {
		$sql = "SELECT * from image where Lien_Image LIKE ?;";
		
		$this->_setSql($sql);
		$data = $this->getRow(array($image->getLink()));
		if(!$data){
			$sql = "INSERT INTO `auteur`(`Lien_Image`, `Format`) VALUES (?, ?)";	
			$this->_setSql($sql);				
			return $this->insert(array($image->getLink(), $image->getFormat()));
		}
		return $data['idImage'];
	}

	public function getHeader($header) {
		$sql = "SELECT * from entete where Titre LIKE '" . $header->getTitle() . "' AND Lien LIKE '" . $header->getLink() . "' AND Resume LIKE '" . $header->getResume() . "';";
		$this->_setSql($sql);
		$data = $this->getRow();
		if(!$data){
			$idAuthor 	= $this->getAuthor($header->getAuthor());
			$idImage 	= $this->getImage($header->getImage());

			$sql = "INSERT INTO `entete`(`Titre`, `idAuteur`, `idImage`, `Lien`,`Resume`) VALUES (?, ?, ?, ?, ?)";
			$this->_setSql($sql);				
			return $this->insert(array($name, $idAuthor, $idImage, $link, $resume));
		}
		return $data['idEntete'];
	}

	public function isExisting($test, $idPlatform, $idHeader) {
		$sql = "SELECT * from test where idJeu = " . $test->getIdGame() . " AND idEntete = ".$idHeader." AND idPlateform = ".$idPlatform." AND Date_Publication LIKE '".$test->getPublicationDate()."' AND Type LIKE '".$test->getType()."';";
		$this->_setSql($sql);
		return $this->getRow();
	}

	public function insertTest($test) {
		$platformModel 	= $this->_getModel("platform");

		$idPlatform = $platformModel->getPlatformIdByName($test->getPlateform());
		$idHeader	= $this->getHeader($test->getHeader());

		$exist = $this->isExisting($test, $idPlatform, $idHeader);
		if(!$exist) {
			$sql = "INSERT INTO `test` (`idJeu`, `idEntete`, `idPlateform`, `Date_Publication`, `Type`) VALUES (?, ?, ?, ?, ?)";
			$this->_setSql($sql);			
			return $this->insert(array($test->getIdGame(), $idHeader, $idPlatform, $test->getPublicationDate(), $test->getType()));
		} else {
			return $exist['idTest'];
		}
	}
}