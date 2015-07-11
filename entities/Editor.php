<?php
	class Editor {
		private $id;
		private $name;
		private $informationId;

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
			return $this->informationId;
		}

		public function setIdInformation($informationId){
			$this->informationId = $informationId;
		}
	}