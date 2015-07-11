<?php
	class Tag {
		private $id;
		private $type;
		private $idMedia;

		function __construct() {

		}

		public function getId() {
			return $this->id;
		}

		public function setId($id) {
			$this->id = $id;
		}

		public function getType() {
			return $this->type;
		}

		public function setType($type){
			$this->type = $type;
		}

		public function getIdMedia() {
			return $this->idMedia;
		}

		public function setIdMedia($idMedia){
			$this->idMedia = $idMedia;
		}
	}