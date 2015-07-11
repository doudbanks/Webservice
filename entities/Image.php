<?php
	class Image{
		private $id;
		private $format;
		private $link;

		function __construct() {

		}

		public function getId() {
			return $this->id;
		}

		public function setId($id) {
			$this->id = $id;
		}

		public function getFormat() {
			return $this->format;
		}

		public function setFormat($format) {
			$this->format = $format;
		}

		public function getLink() {
			return $this->link;
		}

		public function setLink($link) {
			$this->link = $link;
		}

	}