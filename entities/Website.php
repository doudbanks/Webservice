<?php
	class Website {
		private $id;
		private $id_information;
		private $country;
		private $link;

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

		public function getCountry() {
			return $this->country;
		}

		public function setCountry($country) {
			$this->country = $country;
		}

		public function getLink() {
			return $this->link;
		}

		public function setLink($link) {
			$this->link = $link;
		}
	}