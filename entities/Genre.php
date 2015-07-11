<?php
	class Genre {
		private $id;
		private $id_information;
		private $name;

		function __construct() {
			
		}

		public function getId() {
			return $this->id;
		}

		public function setId($id) {
			$this->id = $id;
		}

		public function getIdInformation() {
			return $this->id_information;
		}

		public function setIdInformation($id_information) {
			$this->id_information = $id_information;
		}

		public function getName() {
			return $this->name;
		}

		public function setName($name) {
			$this->name = $name;
		}
	}