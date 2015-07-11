<?php
	class Redactor {
		private $id;
		private $id_opinion;
		private $mark;
		private $tester;
		private $text;
		private $idGame;

		function __construct() {

		}

		public function getId() {
			return $this->id;
		}

		public function setId($id) {
			$this->id = $id;
		}

		public function getIdOpinion() {
			return $this->id_opinion;
		}

		public function setIdOpinion($id_opinion) {
			$this->id_opinion = $id_opinion;
		}

		public function getMark() {
			return $this->mark;
		}

		public function setMark($mark) {
			$this->mark = $mark;
		}

		public function getTester() {
			return $this->tester;
		}

		public function setTester($tester) {
			$this->tester = $tester;
		}

		public function getText() {
			return $this->text;
		}

		public function setText($text) {
			$this->text = $text;
		}
	}