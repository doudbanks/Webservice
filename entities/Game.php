<?php
	class Game {
		private $id;
		private $idInformation;
		private $active;
		
		private $information;
		private $listTest		= array();
		private $listOpinion	= array();
		private $listMedia		= array();

		function __construct() {

		}

		public function getId() {
			return $this->id;
		}

		public function setId($id) {
			$this->id = $id;
		}

		public function getIdInformation() {
			return $this->idInformation;
		}

		public function setIdInformation($idInformation) {
			$this->idInformation = $idInformation;
		}

		public function isActive() {
			return $this->active;
		}

		public function setIsActive($active) {
			$this->active = $active;
		}
		
		public function getInformation() {
			return $this->information;
		}

		public function setInformation($information) {
			$this->information = $information;
		}

		public function getTests() {
			return $this->listTest;
		}

		public function setTests($listTest) {
			$this->listTest = $listTest;
		}

		public function getMedias() {
			return $this->listMedia;
		}

		public function setMedias($listMedia) {
			$this->listMedia = $listMedia;
		}

		public function getOpinions() {
			return $this->listOpinion;
		}

		public function setOpinions($listOpinion) {
			$this->listOpinion = $listOpinion;
		}
	}