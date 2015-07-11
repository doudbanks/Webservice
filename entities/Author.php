<?php 
	class Author {
		private $id;
		private $function;
		private $description;

		function __construct(){

		}

		public function getId() {
			return $this->id;
		}

		public function setId($id) {
			$this->id = $id;
		}

		public function getFunction() {
			return $this->function;
		}

		public function setFunction($function) {
			$this->function = $function;
		}

		public function getDescription() {
			return $this->description;
		}

		public function setDescription($description) {
			$this->description = $description;
		}
	}