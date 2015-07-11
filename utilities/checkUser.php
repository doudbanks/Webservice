<?php
Class CheckUser extends model{

	private $APISecret = 123456789;
	public static $ValidTime = 5;
	
	private function GetUserByApiKey($apiKey){
		$sql = "SELECT * from users where APIKey = ".$apiKey;
		$this->_setSql($sql);
		return $this->getRow();
	}


	public function HashUser($apiKey, $isAdmin = 0, $time){
		$tmp = md5($apiKey.";".$this->APISecret.";".$isAdmin.";".$time);
		return sha1($tmp);
	}

	public static function CompareHashes($clientHash, $apiKey, $isAdmin, $needAdmin){

		$checkUser = new CheckUser();
		$user = $checkUser->GetUserByApiKey($apiKey);
		if(!$needAdmin) {
			$user['IsAdmin'] = $isAdmin;
		} else if($needAdmin && $user['IsAdmin'] == 0) {
			die("Access denied");
		}

		for($i = 0; $i < 5; $i++){
			$serverHash = $checkUser->HashUser($user['APIKey'], $user['IsAdmin'],(time()- $i));
			if($clientHash == $serverHash)
				return true;			
		}
		return false;
	}
}