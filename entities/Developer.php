<?php
	class Developer {
		private $id;
		private $name;
		private $idInformation;

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

		public function setName($name){
			$this->name = $name;
		}

		public function getIdInformation() {
			return $this->idInformation;
		}

		public function setIdInformation($idInformation){
			$this->idInformation = $idInformation;
		}
	}