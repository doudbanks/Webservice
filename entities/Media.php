<?php 
	class Media {
		private $id;
		private $title;
		private $link;
		private $date;
		private $description;
		private $type;
		private $nb_View;
		private $idGame;

		private $listPlateform;
		private $listTypeMedia;
		private $listTag;

		function __construct() {

		}

		public function getId() {
			return $this->id;
		}

		public function setId($id) {
			$this->id = $id;
		}

		public function getTitle() {
			return $this->title;
		}

		public function setTitle($title) {
			$this->title = $title;
		}

		public function getLink() {
			return $this->link;
		}

		public function setLink($link) {
			$this->link = $link;
		}

		public function getDate() {
			return $this->date;
		}

		public function setDate($date) {
			$this->date = $date;
		}

		public function getDescription() {
			return $this->description;
		}

		public function setDescription($description) {
			$this->description = $description;
		}

		public function getType() {
			return $this->type;
		}

		public function setType($type) {
			$this->type = $type;
		}

		public function getNbView() {
			return $this->nb_View;
		}

		public function setNbView($nb_View) {
			$this->nb_View = $nb_View;
		}

		public function getIdGame() {
			return $this->idGame;
		}

		public function setIdGame($idGame) {
			$this->idGame = $idGame;
		}

		public function getPlateforms(){
			return $this->listPlateform;
		}

		public function setPlateforms($listPlateform) {
			$this->listPlateform = $listPlateform;
		}

		public function getTags(){
			return $this->listTag;
		}

		public function setTags($listTag) {
			$this->listTag = $listTag;
		}

		public function getTypeMedias(){
			return $this->listTypeMedias;
		}

		public function setTypeMedias($listTypeMedias) {
			$this->listTypeMedias = $listTypeMedias;
		}
	}