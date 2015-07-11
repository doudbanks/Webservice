<?php

class ThemeModel extends Model {

	public function getThemesByInformationId($id) {
		$sql = "SELECT * from themes where idInformation=?";
		
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
		$object = new Theme();
		$object->setId($data['idThemes']);
		$object->setName($data['Nom']);

		return $object;
	}

	public function isExisting($theme) {
		$sql = "SELECT * from themes where idInformation = " . $theme->getIdInformation() . " AND Nom LIKE '".$theme->getName()."';";
		
		$this->_setSql($sql);
		return $this->getRow();
	}

	public function insertTheme($theme) {

		$exist =  $this->isExisting($theme);
		if(!$exist){
			$sql = "INSERT INTO `themes`(`idInformation`, `Nom`) VALUES (?, ?)";
			$this->_setSql($sql);				
			return $this->insert(array($theme->getIdInformation(), $theme->getName()));
		} else {
			return $exist['idThemes'];
		}
	}
}