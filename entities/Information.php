<?php 
	class Information {
		private $id;
		private $name;
		private $nb_max_player;
		private $description;
		private $classification;

		private $listEditor 	= array();
		private $listDeveloper 	= array();
		private $listRelease 	= array();
		private $listGenre 		= array();
		private $listTheme 		= array();
		private $listMode 		= array();
		private $listWebsite	= array();
		private $listEcoModel	= array();
		private $listSupports	= array();

		function __construct() {

		}

		public function getId() {
			return $this->id;
		}

		public function setId($id) {
			$this->id = $id;
		}

		public function getName() {
			return $this->name;
		}

		public function setName($name) {
			$this->name = $name;
		}

		public function getNbMaxPlayer() {
			return $this->nb_max_player;
		}

		public function setNbMaxPlayer($nb_max_player) {
			$this->nb_max_player = $nb_max_player;
		}

		public function getDescription() {
			return $this->description;
		}

		public function setDescription($description) {
			$this->description = $description;
		}

		public function getClassification() {
			return $this->classification;
		}

		public function setClassification($classification) {
			$this->classification = $classification;
		}

		public function getEditors() {
			return $this->listEditor;
		}

		public function setEditors($listEditor) {
			$this->listEditor = $listEditor;
		}

		public function getDevelopers() {
			return $this->listDeveloper;
		}

		public function setDevelopers($listDeveloper) {
			$this->listDeveloper = $listDeveloper;
		}

		public function getReleases() {
			return $this->listRelease;
		}

		public function setReleases($listRelease) {
			$this->listRelease = $listRelease;
		}

		public function getGenres() {
			return $this->listGenres;
		}

		public function setGenres($listGenres) {
			$this->listGenres = $listGenres;
		}

		public function getThemes() {
			return $this->listTheme;
		}

		public function setThemes($listTheme) {
			$this->listTheme = $listTheme;
		}

		public function getModes() {
			return $this->listMode;
		}

		public function setModes($listMode) {
			$this->listMode = $listMode;
		}

		public function getWebsites() {
			return $this->listWebsites;
		}

		public function setWebsites($listWebsites) {
			$this->listWebsites = $listWebsites;
		}

		public function getEcoModels() {
			return $this->listEcoModel;
		}

		public function setEcoModels($listEcoModel) {
			$this->listEcoModel = $listEcoModel;
		}

		public function getSupports() {
			return $this->listSupport;
		}

		public function setSupports($listSupport) {
			$this->listSupport = $listSupport;
		}
	}