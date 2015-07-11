<?php

class Model 
{
	protected $_db;
	protected $_sql;
	protected $_model;
	protected $_entity;
	private $APIKey = 123456;
	
	public function __construct()
	{
		$this->_db = Db::init();
	}

	protected function _getModel($modelName) {
		$modelName .= 'Model';
		$this->_model = new $modelName();

		return $this->_model;
	}
	
	protected function _setSql($sql) {
		$this->_sql = $sql;
	}
	
	public function getAll($data = null) {
		if (!$this->_sql){
			throw new Exception("No SQL query!");
		}
		
		$sth = $this->_db->prepare($this->_sql);
		$sth->execute($data);
		return $sth->fetchAll();
	}
	
	public function getRow($data = null) {
		if (!$this->_sql) {
			throw new Exception("No SQL query!");
		}
		
		$sth = $this->_db->prepare($this->_sql);
		$sth->execute($data);
		return $sth->fetch();
	}

	public function execute($data = null) {
		if (!$this->_sql) {
			throw new Exception("No SQL query!");
		}
		
		$sth = $this->_db->prepare($this->_sql);
		return $sth->execute($data);
	}

	public function insert($data = null) {
		if (!$this->_sql) {
			throw new Exception("No SQL query!");
		}
		
		$sth = $this->_db->prepare($this->_sql);
		$sth->execute($data);
		return $this->_db->lastInsertId();
	}
}