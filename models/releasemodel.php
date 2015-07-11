<?php

class ReleaseModel extends Model {

	public function getReleasesByInformationId($id) {
		$sql = "SELECT * from sorties 
				LEFT JOIN Pays 		ON Pays.idPays 				= sorties.idPays 
				LEFT JOIN Plateform ON Plateform.idPlateform 	= sorties.idPlateform
				where idInformation=?";
		
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
		$object = new Release();
		$object->setId($data['idSorties']);
		$object->setDate($data['Date']);
		$object->setCountry($data['Nom']);

		$plateform = new Platform();
		$plateform->setId($data['idPlateform']);
		$plateform->setName($data['Nom_Plateform']);

		$object->setPlateform($plateform);

		return $object;
	}

	public function isExisting($release, $idCountry, $idPlatform) {
		$sql = "SELECT * from sorties where idInformation = " . $release->getIdInformation() . " AND idPays = " . $idCountry. " AND idPlateform = " . $idPlatform . " AND Date LIKE '".$release->getDate()."';";
		
		$this->_setSql($sql);
		$result = $this->getRow();
		return $result;
	}

	public function insertRelease($release) {
		$countryModel 	= $this->_getModel("country");
		$platformModel 	= $this->_getModel("platform");

		$idCountry 	= $countryModel->getCountryIdByName($release->getCountry());
		$idPlatform = $platformModel->getPlatformIdByName($release->getPlateform());

		$exist = $this->isExisting($release, $idCountry, $idPlatform);
		if(!$exist){
			$sql = "INSERT INTO `sorties`(`idInformation`, `idPays`, `idPlateform`, `Date`) VALUES (?, ?, ?, ?)";					
			$this->_setSql($sql);
			$this->insert(array($release->getIdInformation(), $idCountry, $idPlatform, $release->getDate()));
		} else {
			return $exist['idSorties'];
		}
	}
}