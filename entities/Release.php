<?php
	class Release {
		private $id;
		private $country;
		private $date;
		private $plateform;
		private $idInformation;

		function __construct() {

		}

		public function getId() {
			return $this->id;
		}

		public function setId($id) {
			$this->id = $id;
		}

		public function getCountry() {
			return $this->country;
		}

		public function setCountry($country) {
			$this->country = $country;
		}

		public function getDate() {
			return $this->date;
		}

		public function setDate($date) {
			$this->date = $date;
		}

		public function getPlateform() {
			return $this->plateform;
		}

		public function setPlateform($plateform) {
			$this->plateform = $plateform;
		}

		public function getIdInformation() {
			return $this->idInformation;
		}

		public function setIdInformation($idInformation) {
			$this->idInformation = $idInformation;
		}
	}