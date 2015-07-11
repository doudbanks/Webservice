<?php
	class Opinion {
		private $id;
		private $id_game;
		private $type;

		private $listRedactor = array();

		function __construct() {

		}

		public function getId() {
			return $this->id;
		}

		public function setId($id) {
			$this->id = $id;
		}

		public function getIdGame() {
			return $this->id_game;
		}

		public function setIdGame($id_game) {
			$this->id_game = $id_game;
		}

		public function getType() {
			return $this->type;
		}

		public function setType($type) {
			$this->type = $type;
		}

		public function getRedactors() {
			return $this->listRedactor;
		}

		public function setRedactors($listRedactor) {
			$this->listRedactor = $listRedactor;
		}
	}