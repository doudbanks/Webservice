<?php
	class Mark {
		private $id;
		private $type;
		private $value;
		private $content;
		private $idTest;

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

		public function getValue() {
			return $this->value;
		}

		public function setValue($value) {
			$this->value = $value;
		}

		public function getContent() {
			return $this->content;
		}

		public function setContent($content){
			$this->content = $content;
		}

		public function getIdTest() {
			return $this->idTest;
		}

		public function setIdTest($idTest){
			$this->idTest = $idTest;
		}
	}