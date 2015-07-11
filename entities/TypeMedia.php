<?php 
	class TypeMedia {
		private $id;
		private $id_Media;
		private $type;
		private $description;

		function __construct(){

		}

		public function getId() {
			return $this->id;
		}

		public function setId($id) {
			$this->id = $id;
		}

		public function getIdMedia() {
			return $this->id_Media;
		}

		public function setIdMedia($id_Media) {
			$this->id_Media = $id_Media;
		}

		public function getType() {
			return $this->type;
		}

		public function setType($type) {
			$this->type = $type;
		}

		public function getDescription() {
			return $this->description;
		}

		public function setDescription($description) {
			$this->description = $description;
		}
	}