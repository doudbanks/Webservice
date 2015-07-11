<?php
$controller = null;
$action 	= "index";
$query 		= null;
$query2		= "xml";

$APIKEY		= 123456;
$ISADMIN	= 1;

if (isset($_GET['load'])) {
	$params = array();
	$params = explode("/", $_GET['load']);
	$controller = ucwords($params[0]);

	$checkUser = new CheckUser();

	header('HTTP_ApiKey: '. $APIKEY);
	header('HTTP_IsAdmin: '. $ISADMIN);
	header('HTTP_Hash: '. $checkUser->HashUser($APIKEY, $ISADMIN, time()));


	switch($_SERVER['REQUEST_METHOD']){
		case "DELETE":
			$action = "delete";
			parse_str(file_get_contents("php://input"),$var);
			if(isset($var['data'])) {
				$query = $var['data'];
				$query2= null;
			}
			else
				die('No variable was found.');
		break;
		case "POST":
			$action = "insert";
			$query = $_POST['data'];
			$query2= null;
			break;
		case "PUT":
			$action = "update";
			$array = array();
			parse_raw_http_request($array);
			if(isset($array['data'])) {
				$query = $array['data'];
				$query2= null;
			}
			else
				die('No variable was found.');
		 	break;
		default:
			if (isset($params[1]) && !empty($params[1])){
				$action = $params[1];
			}
			
			if (isset($params[2]) && !empty($params[2])){
				$query = $params[2];
			}


			if(is_numeric($action)){
				$action = "getGameById";
				$query	=  $params[1];
				if(isset($params[2]) && !empty($params[2])){
					$query2	=  $params[2];
				}
			} else if ($action == "xml" || $action == "json") {
				$action = "index";
				$query = $params[1];
				$query2= null;
			} else {
				$action = "index";
				$query2 = null;
			}
		break;
	}
} else {
	die("Invalid controller. Please select 'API' controller");
}

$modelName = $controller;
$controller .= 'Controller';
$load = new $controller($modelName, $action);

if(isset(apache_response_headers() ['HTTP_ApiKey']) && isset(apache_response_headers() ['HTTP_IsAdmin']) && isset(apache_response_headers() ['HTTP_Hash'])) {
	$hash = array( 	'ApiKey' 	=>	apache_response_headers() ['HTTP_ApiKey'],
					'IsAdmin' 	=>	apache_response_headers() ['HTTP_IsAdmin'],
					'Hash'		=> apache_response_headers() ['HTTP_Hash']);
} else {
	die('Invalid user. Please check the UserKey.');
}


if (method_exists($load, $action)){
	if($query2 == null){
    	$load->{$action}($query, $hash);
    } else {
    	$load->{$action}($query, $query2, $hash);
    }
} else {
		die('Invalid method. Please check the URL.');
}

function parse_raw_http_request(array &$a_data) {
  // read incoming data
  $input = file_get_contents('php://input');
 
  // grab multipart boundary from content type header
  preg_match('/boundary=(.*)$/', $_SERVER['CONTENT_TYPE'], $matches);
 
  // content type is probably regular form-encoded
  if (!count($matches))
  {
    // we expect regular puts to containt a query string containing data
    parse_str(urldecode($input), $a_data);
    return $a_data;
  }
 
  $boundary = $matches[1];
 
  // split content by boundary and get rid of last -- element
  $a_blocks = preg_split("/-+$boundary/", $input);
  array_pop($a_blocks);
 
  // loop data blocks
  foreach ($a_blocks as $id => $block)
  {
    if (empty($block))
      continue;
 
    // you'll have to var_dump $block to understand this and maybe replace \n or \r with a visibile char
 
    // parse uploaded files
    if (strpos($block, 'application/octet-stream') !== FALSE)
    {
      // match "name", then everything after "stream" (optional) except for prepending newlines
      preg_match("/name=\"([^\"]*)\".*stream[\n|\r]+([^\n\r].*)?$/s", $block, $matches);
      $a_data['files'][$matches[1]] = $matches[2];
    }
    // parse all other fields
    else
    {
      // match "name" and optional value in between newline sequences
      preg_match('/name=\"([^\"]*)\"[\n|\r]+([^\n\r].*)?\r$/s', $block, $matches);
      $a_data[$matches[1]] = $matches[2];
    }
  }
}

