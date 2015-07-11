<?php

class EditorModel extends Model {

	public function getEditorsByInformationId($id) {
		$sql = "SELECT * from editeur where idInformation=?";
		
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
		$object = new Editor();
		$object->setId($data['idEditeur']);
		$object->setName($data['Nom']);

		return $object;
	}

	public function isExisting($editor) {
		$sql = "SELECT * from editeur where Nom LIKE '" . $editor->getName() . "' AND idInformation = ".$editor->getIdInformation().";";
		$this->_setSql($sql);
		return $this->getRow();
	}

	public function insertEditor($editor) {
		$exist = $this->isExisting($editor);

		if(empty($exist)){
			$sql = "INSERT INTO `editeur`(`Nom`, `idInformation`) VALUES ( ?, ?)";					
			$this->_setSql($sql);
			return $this->insert(array($editor->getName(), $editor->getIdInformation()));
		} else {
			return $exist['idEditeur'];
		}
	}
}