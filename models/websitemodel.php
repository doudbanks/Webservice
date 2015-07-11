<?php

class WebsiteModel extends Model {

	public function getWebsitesByInformationId($id) {
		$sql = "SELECT * from site 
				LEFT JOIN Pays ON Pays.idPays = site.idPays 
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
		$object = new Website();
		$object->setId($data['idSite']);
		$object->setLink($data['Lien']);
		$object->setCountry($data['Nom']);

		return $object;
	}

	public function isExisting($website, $idCountry) {
		$sql = "SELECT * from site where idInformation = " . $website->getIdInformation() . " AND idPays = ".$idCountry." AND Lien = '".$website->getLink()."';";
		$this->_setSql($sql);
		return $this->getRow();
	}

	public function insertWebsite($website) {
		$countryModel 	= $this->_getModel("country");

		$idCountry = $countryModel->getCountryIdByName($website->getCountry());

		$exist = $this->isExisting($website, $idCountry);
		if(!$exist){
			$sql = "INSERT INTO `site`(`idInformation`, `idPays`, `Lien`) VALUES (?, ?, ?)";
			$this->_setSql($sql);				
			return $this->insert(array($website->getIdInformation(), $idCountry, $website->getLink()));
		} else {
			return $exist['idSite'];
		}
	}
}