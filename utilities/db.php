<?php

class Db
{
	private static $db;
	
	public static function init()
	{
		if (!self::$db)
		{
			try {
				$dsn = 'mysql:host='.DB_HOST.';dbname='.DB_NAME.';charset=UTF-8';
				self::$db = new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME.';charset=utf8', DB_USER, DB_PASS);
				self::$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				self::$db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
			} catch (PDOException $e) {
				error_log($e->getMessage());
    			die("A database error was encountered -> " . $e->getMessage() );
			}
		}
		return self::$db;
	}
}
