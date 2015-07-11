<?php

class ValidateXML {

	private static function libxml_display_error($error) {
		echo $error->message . "<br/>";
	}
 
	private static function libxml_display_errors($display_errors = true) {
		$errors = libxml_get_errors();
		$chain_errors = "";

		foreach ($errors as $error) {
			$chain_errors .= preg_replace('/( in\ \/(.*))/', '', strip_tags(ValidateXML::libxml_display_error($error)))."\n";
			if ($display_errors) {
				ValidateXML::libxml_display_error($error);
			}
		}
		libxml_clear_errors();

		return $chain_errors;
	}

	public static function Validate($xml) {
		// Activer "user error handling"
		libxml_use_internal_errors(true); 

		$schema = "jeux.xsd";

		// Validation du document XML
		$validate = $xml->schemaValidate($schema); 

		// Affichage du résultat
		if ($validate) {
			return true;
		} else {
			echo "<b> Generated Errors !</b><br /><br />";
			ValidateXML::libxml_display_errors();
		}
	}
}