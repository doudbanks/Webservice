<?php

class ApiController extends Controller {

	public function __construct($model, $action) {
		// On charge le model et l'action par défaut
		parent::__construct($model, $action);
		$this->_setModel($model);
	}

	public function index($type, $hash) {

		//On récupère tous les jeux
		$data = $this->_model->getAllGames($type, $hash);

		//On envoi les données à la vue
		$this->_view->set('data', $data);
		return $this->_view->output();
	}

	public function getGameById($id, $type, $hash) {
		//On récupère le jeu en fonction de son id
		$data = $this->_model->getGameById($id, $type, $hash);	

		//On envoi les données à la vue
		$this->_view->set('data', $data);
		return $this->_view->output();
	}

	public function delete($id, $hash){
		$data = $this->_model->deleteGame($id, $hash);

		//On envoi les données à la vue
		$this->_view->set('data', $data);
		return $this->_view->output();
	}

	public function insert($xml, $hash) {
		$data = $this->_model->insertGameByXML($xml, $hash);

		$this->_view->set('data', $data);
		return $this->_view->output();
	}

	public function update($xml, $hash) {
		$data = $this->_model->updateGameByXML($xml, $hash);

		$this->_view->set('data', $data);
		return $this->_view->output();
	}
}

