<?php
 	class Test {
 		private $id;
 		private $publication_date;
 		private $type;
 		private $plateform;
 		private $idGame;
 		private $header;
 		private $listBloc	= array();
 		private $listMark	= array();

 		function __construct() {

		}

		public function getId() {
			return $this->id;
		}

		public function setId($id) {
			$this->id = $id;
		}

		public function getHeader() {
			return $this->header;
		}

		public function setHeader($header) {
			$this->header = $header;
		}

		public function getPublicationDate() {
			return $this->publication_date;
		}

		public function setPublicationDate($publication_date) {
			$this->publication_date = $publication_date;
		}

		public function getType() {
			return $this->type;
		}

		public function setType($type) {
			$this->type = $type;
		}

		public function getPlateform() {
			return $this->plateform;
		}

		public function setPlateform($plateform) {
			$this->plateform = $plateform;
		}

		public function getBlocs() {
			return $this->listBloc;
		}

		public function setBlocs($listBloc) {
			$this->listBloc = $listBloc;
		}

		public function getMarks() {
			return $this->listmarks;
		}

		public function setMarks($listmarks) {
			$this->listmarks = $listmarks;
		}

		public function getIdGame() {
			return $this->idGame;
		}

		public function setIdGame($idGame) {
			$this->idGame = $idGame;
		}
 	}