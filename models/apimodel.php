<?php

class ApiModel extends Model {

	// Méthode permettant de récupérer tous les jeux
	public function getAllGames($type, $hash) {

		if(!CheckUser::CompareHashes($hash['Hash'], $hash['ApiKey'], $hash['IsAdmin'], false)) {
			die('Invalid user. Please check the UserKey.');
		}

		/** Chargement des modèles ***/
		$gameModel 			= $this->_getModel("game");
		$informationModel 	= $this->_getModel("information");
		$testModel 			= $this->_getModel("test");
		$opinionModel 		= $this->_getModel("opinion");
		$redactorModel 		= $this->_getModel("redactor");
		$editorModel 		= $this->_getModel("editor");
		$developerModel 	= $this->_getModel("developer");
		$releaseModel 		= $this->_getModel("release");
		$genreModel 		= $this->_getModel("genre");
		$themeModel 		= $this->_getModel("theme");
		$modeModel 			= $this->_getModel("mode");
		$websiteModel 		= $this->_getModel("website");
		$ecoModelModel 		= $this->_getModel("ecoModel");
		$supportModel 		= $this->_getModel("support");
		$blocModel 			= $this->_getModel("bloc");
		$markModel 			= $this->_getModel("mark");
		$mediaModel 		= $this->_getModel("media");

		// On récupères tous les jeux
		$games = $gameModel->getAllGames();

		//Pour chaque jeux
		if($games != null){
			foreach($games as $game) {
				// On récupère son information
				$game->setInformation($informationModel->getInformationById($game->getIdInformation()));

				if($game->getInformation() != false){
					$game->getInformation()->setEditors		($editorModel->getEditorsByInformationId($game->getInformation()->getId()));
					$game->getInformation()->setDevelopers	($developerModel->getDevelopersByInformationId($game->getInformation()->getId()));
					$game->getInformation()->setReleases	($releaseModel->getReleasesByInformationId($game->getInformation()->getId()));
					$game->getInformation()->setGenres		($genreModel->getGenresByInformationId($game->getInformation()->getId()));
					$game->getInformation()->setThemes		($themeModel->getThemesByInformationId($game->getInformation()->getId()));
					$game->getInformation()->setModes 		($modeModel->getModesByInformationId($game->getInformation()->getId()));
					$game->getInformation()->setWebsites	($websiteModel->getWebsitesByInformationId($game->getInformation()->getId()));
					$game->getInformation()->setEcoModels	($ecoModelModel->getEcoModelsByInformationId($game->getInformation()->getId()));
					$game->getInformation()->setSupports	($supportModel->getSupportsByInformationId($game->getInformation()->getId()));
				}

				// On récupères ses tests
				$game->setTests($testModel->getTestsByGameId($game->getId()));

				if(!empty($game->getTests())) {
					foreach($game->getTests() as $test){
						$test->setBlocs	($blocModel->getBlocsByTestId($test->getId()));
						$test->setMarks	($markModel->getMarksByTestId($test->getId()));
					}
				}
				
				// On récupère ses opinions
				$game->setOpinions($opinionModel->getOpinionsByGameId($game->getId()));
				if(!empty($game->getOpinions())) {
					foreach($game->getOpinions() as $opinion){
						$opinion->setRedactors($redactorModel->getRedactorsByOpinionId($opinion->getId()));
					}
				}

				// On récupère ses médias
				$game->setMedias($mediaModel->getMediasByGameId($game->getId()));
			}
		}

		$xml = $this->convertGamesToXML($games);
		if(ValidateXML::Validate($xml)){
			return $this->getResult($type, $xml);
		}
	}

	//Methode permettant de récuperer un jeu en fonction de son Id
	public function getGameById($id, $type, $hash) {

		if(!CheckUser::CompareHashes($hash['Hash'], $hash['ApiKey'], $hash['IsAdmin'], false)) {
			die('Invalid user. Please check the UserKey.');
		}

		/** Chargement des modèles ***/
		$gameModel 			= $this->_getModel("game");
		$informationModel 	= $this->_getModel("information");
		$testModel 			= $this->_getModel("test");
		$opinionModel 		= $this->_getModel("opinion");
		$redactorModel 		= $this->_getModel("redactor");
		$editorModel 		= $this->_getModel("editor");
		$developerModel 	= $this->_getModel("developer");
		$releaseModel 		= $this->_getModel("release");
		$genreModel 		= $this->_getModel("genre");
		$themeModel 		= $this->_getModel("theme");
		$modeModel 			= $this->_getModel("mode");
		$websiteModel 		= $this->_getModel("website");
		$ecoModelModel 		= $this->_getModel("ecoModel");
		$supportModel 		= $this->_getModel("support");
		$blocModel 			= $this->_getModel("bloc");
		$markModel 			= $this->_getModel("mark");
		$mediaModel 		= $this->_getModel("media");

		$game = $gameModel->getGameById($id);

		if($game->getId() == null)
			die('Game not found.');
		// On récupère son information
		$game->setInformation($informationModel->getInformationById($game->getId()));

		if($game->getInformation() != false){
			$game->getInformation()->setEditors		($editorModel->getEditorsByInformationId($game->getInformation()->getId()));
			$game->getInformation()->setDevelopers	($developerModel->getDevelopersByInformationId($game->getInformation()->getId()));
			$game->getInformation()->setReleases	($releaseModel->getReleasesByInformationId($game->getInformation()->getId()));
			$game->getInformation()->setGenres		($genreModel->getGenresByInformationId($game->getInformation()->getId()));
			$game->getInformation()->setThemes		($themeModel->getThemesByInformationId($game->getInformation()->getId()));
			$game->getInformation()->setModes 		($modeModel->getModesByInformationId($game->getInformation()->getId()));
			$game->getInformation()->setWebsites	($websiteModel->getWebsitesByInformationId($game->getInformation()->getId()));
			$game->getInformation()->setEcoModels	($ecoModelModel->getEcoModelsByInformationId($game->getInformation()->getId()));
			$game->getInformation()->setSupports	($supportModel->getSupportsByInformationId($game->getInformation()->getId()));
		}

		// On récupères ses tests
		$game->setTests($testModel->getTestsByGameId($game->getId()));

		if(!empty($game->getTests())) {
			foreach($game->getTests() as $test){
				$test->setBlocs	($blocModel->getBlocsByTestId($test->getId()));
				$test->setMarks	($markModel->getMarksByTestId($test->getId()));
			}
		}
		
		// On récupère ses opinions
		$game->setOpinions($opinionModel->getOpinionsByGameId($game->getId()));
		if(!empty($game->getOpinions())) {
			foreach($game->getOpinions() as $opinion){
				$opinion->setRedactors($redactorModel->getRedactorsByOpinionId($opinion->getId()));
			}
		}

		// On récupère ses médias
		$game->setMedias($mediaModel->getMediasByGameId($game->getId()));

		return $this->getResult($type, ConverterUtilities::convertGameToXML(null, $game));
	}

	// Méthode permettant de désactiver un jeu
	public function deleteGame($id, $hash) {

		if(!CheckUser::CompareHashes($hash['Hash'], $hash['ApiKey'], $hash['IsAdmin'], true)) {
			die('Invalid user. Please check the UserKey.');
		}

		$gameModel 			= $this->_getModel("game");

		$result = $gameModel->deleteGame($id);

		return "ok";
	}

	// Méthode permettant de supprimer un jeu en fonction de son nom (Pour Update) 
	public function realDeleteGameByName($name) {
		$gameModel 			= $this->_getModel("game");

		$result = $gameModel->realDeleteGameByName($name);

		return $result;
	}

	public function insertGameByXML($data, $hash) {
		var_dump($hash);
		if(!CheckUser::CompareHashes($hash['Hash'], $hash['ApiKey'], $hash['IsAdmin'], true)) {
			die('Invalid user. Please check the UserKey.');
		}
		// On convertie la valeur reçu en XML
		$xml = ConverterUtilities::stringToXML($data);

		// On convertie le XML en entités
		$game = ConverterUtilities::XMLtoGame($xml);

		return $this->insertGame($game);
	}

	private function insertGame($game) {
		$gameModel 			= $this->_getModel("game");
		$informationModel 	= $this->_getModel("information");
		$editorModel 		= $this->_getModel("editor");
		$developerModel 	= $this->_getModel("developer");
		$releaseModel 		= $this->_getModel("release");
		$genreModel 		= $this->_getModel("genre");
		$themeModel 		= $this->_getModel("theme");
		$modeModel 			= $this->_getModel("mode");
		$websiteModel 		= $this->_getModel("website");
		$ecoModelModel 		= $this->_getModel("ecoModel");
		$supportModel 		= $this->_getModel("support");
		$testModel 			= $this->_getModel("test");
		$blocModel 			= $this->_getModel("bloc");
		$markModel 			= $this->_getModel("mark");
		$mediaModel 		= $this->_getModel("media");
		$opinionModel 		= $this->_getModel("opinion");
		$redactorModel 		= $this->_getModel("redactor");

		// On insère l'information
		$game->setIdInformation($informationModel->insertInformation($game->getInformation()));

		//On insère les éditeurs
		$listEditor = $game->getInformation()->getEditors();
		if(!empty($listEditor)) {
			foreach($listEditor as $editor) {
				$editor->setIdInformation($game->getIdInformation());
				$editorModel->insertEditor($editor);
			}
		}

		//On insère les développeurs
		$listDeveloper = $game->getInformation()->getDevelopers();
		if(!empty($listDeveloper)) {
			foreach($listDeveloper as $developer) {
				$developer->setIdInformation($game->getIdInformation());
				$developerModel->insertDeveloper($developer);
			}
		}

		//On insère les sorties
		$listRelease = $game->getInformation()->getReleases();
		if(!empty($listRelease)) {
			foreach($listRelease as $release) {
				$release->setIdInformation($game->getIdInformation());
				$releaseModel->insertRelease($release);

			}
		}

		//On insère les genres
		$listGenre = $game->getInformation()->getGenres();
		if(!empty($listGenre)) {
			foreach($listGenre as $genre) {
				$genre->setIdInformation($game->getIdInformation());
				$genreModel->insertGenre($genre);
			}
		}

		//On insère les thèmes
		$listTheme = $game->getInformation()->getThemes();
		if(!empty($listTheme)) {
			foreach($listTheme as $theme) {
				$theme->setIdInformation($game->getIdInformation());
				$themeModel->insertTheme($theme);
			}
		}

		//On insère les modes
		$listMode = $game->getInformation()->getModes();
		if(!empty($listMode)) {
			foreach($listMode as $mode) {
				$mode->setIdInformation($game->getIdInformation());
				$modeModel->insertMode($mode);
			}
		}

		//On insère les sites
		$listSite = $game->getInformation()->getWebsites();
		if(!empty($listSite)) {
			foreach($listSite as $website) {
				$website->setIdInformation($game->getIdInformation());
				$websiteModel->insertWebsite($website);
			}
		}

		//On insère les modeles economiques
		$listEcoModel = $game->getInformation()->getEcoModels();
		if(!empty($listEcoModel)) {
			foreach($listEcoModel as $ecoModel) {
				$ecoModel->setIdInformation($game->getIdInformation());
				$ecoModelModel->insertEcoModel($ecoModel);
			}
		}

		//On insère les supports
		$listSupport = $game->getInformation()->getSupports();
		if(!empty($listSupport)) {
			foreach($listSupport as $support) {
				$support->setIdInformation($game->getIdInformation());
				$supportModel->insertSupport($support);
			}
		}

		$game->setId($gameModel->insertGame($game));

		//On insère les tests
		$listTest = $game->getTests();
		if(!empty($listTest)) {
			foreach($listTest as $test) {
				$test->setIdGame($game->getId());
				$test->setId($testModel->insertTest($test));

				//On insère les blocs
				$listBloc = $test->getBlocs();
				if(!empty($listBloc)) {
					foreach($listBloc as $bloc) {
						$bloc->setIdTest($test->getId());
						$blocModel->insertBloc($bloc);
					}
				}

				//On insère les notes
				$listMark = $test->getMarks();
				if(!empty($listMark)) {
					foreach($listMark as $mark) {
						$mark->setIdTest($test->getId());
						$markModel->insertMark($mark);
					}
				}
			}
		}

		//On insère les medias
		$listMedia = $game->getMedias();
		if(!empty($listMedia)) {
			foreach($listMedia as $media) {
				$media->setIdGame($game->getId());
				$media->setId($mediaModel->insertGameMedia($media));
			}
		}

		//On insère les opinions
		$listOpinion = $game->getOpinions();
		if(!empty($listOpinion)) {
			foreach($listOpinion as $opinion) {
				$opinion->setIdGame($game->getId());
				$opinion->setId($opinionModel->insertOpinion($opinion));

				//On insère les redacteurs
				$listRedacteur = $opinion->getRedactors();
				if(!empty($listRedacteur)) {
					foreach($listRedacteur as $redactor) {
						$redactor->setIdOpinion($opinion->getId());
						$redactorModel->insertRedactor($redactor);
					}
				}
			}
		}

		return "ok";
	}

	public function updateGameByXML($data, $hash) {
		if(!CheckUser::CompareHashes($hash['Hash'], $hash['ApiKey'], $hash['IsAdmin'], true)) {
			die('Invalid user. Please check the UserKey.');
		}
		// On convertie la valeur reçu en XML
		$xml = ConverterUtilities::stringToXML($data);
		// On convertie le XML en entités
		$game = ConverterUtilities::XMLtoGame($xml);
 
		$this->realDeleteGameByName($game->getInformation()->getName());

		return $this->insertGame($game);
	}

	private function convertGamesToXML($games) {
		$xml = new DOMDocument('1.0', 'utf-8');
		$xml_games = $xml->createElement('jeux');
		$xml->appendChild($xml_games);

		if($games != null){
			foreach($games as $game){
				$xml = ConverterUtilities::convertGameToXML($xml, $game);
			}
		}

		return $xml;
	}

	private function getResult($type, $xml) {
		if($type == "json") {
			header ("Content-Type:text/json");
			$contents= $xml->saveXML();

			$contents = str_replace(array("\n", "\r", "\t"), '', $contents);

			$contents = trim(str_replace('"', "'", $contents));

			$simpleXml = simplexml_load_string($contents);

			$json = json_encode($simpleXml);

			return $json;
		} else {
			header ("Content-Type:text/xml");
			return $xml->saveXML();
		}
	}
}