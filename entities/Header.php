<?php
	class Header {
		private $id;
		private $link;
		private $title;
		private $resume;
		
		private $image;
		private $author;


		function __construct() {

		}

		public function getId() {
			return $this->id;
		}

		public function setId($id) {
			$this->id = $id;
		}

		public function getImage() {
			return $this->image;
		}

		public function setImage($image){
			$this->image = $image;
		}

		public function getAuthor() {
			return $this->author;
		}

		public function setAuthor($author){
			$this->author = $author;
		}

		public function getLink() {
			return $this->link;
		}

		public function setLink($link){
			$this->link = $link;
		}

		public function getTitle() {
			return $this->title;
		}

		public function setTitle($title){
			$this->title = $title;
		}

		public function getResume() {
			return $this->resume;
		}

		public function setResume($resume){
			$this->resume = $resume;
		}
	}