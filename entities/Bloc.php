<?php 
	class Bloc {
		private $id;
		private $idTest;
		private $type;
		private $title;
		private $content;

		function __construct(){

		}

		public function getId() {
			return $this->id;
		}

		public function setId($id) {
			$this->id = $id;
		}

		public function getIdTest() {
			return $this->idTest;
		}

		public function setIdTest($idTest) {
			$this->idTest = $idTest;
		}

		public function getType() {
			return $this->type;
		}

		public function setType($type) {
			$this->type = $type;
		}

		public function getTitle() {
			return $this->title;
		}

		public function setTitle($title) {
			$this->title = $title;
		}

		public function getContent() {
			return $this->content;
		}

		public function setContent($content) {
			$this->content = $content;
		}
	}