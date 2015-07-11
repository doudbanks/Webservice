<?php

class ConverterUtilities {

public static function convertGameToXML($xml, $game) {
		//On récupére les informations du jeu
		$information = $game->getInformation();
		
		if($xml != null){
			$xml_games = $xml->getElementsByTagName('jeux');
  			$xml_games = $xml_games->item(0);
  			
  			$xml_game = $xml->createElement('jeu','');
			$xml_games->appendChild($xml_game);
		} else {
			$xml = new DOMDocument('1.0', 'utf-8');
			$xml_game = $xml->createElement('jeu','');
			$xml->appendChild($xml_game);
		}
		
		$xml_information = $xml->createElement('informations','');
		$xml_game->appendChild($xml_information);

		$xml_information_name = $xml->createElement('nom',$information->getName());
		$xml_information->appendChild($xml_information_name);

		// On ajoute les editeurs
		$xml_information_editeurs = $xml->createElement('editeurs');
		$xml_information->appendChild($xml_information_editeurs);

		if(!empty($information->getDevelopers())){
			foreach($information->getEditors() as $editor) {
				$xml_information_editeur = $xml->createElement('editeur', $editor->getName());
				$xml_information_editeurs->appendChild($xml_information_editeur);
			}
		}

		// On ajoute les développeurs
		$xml_information_developers = $xml->createElement('developpeurs');
		$xml_information->appendChild($xml_information_developers);

		if(!empty($information->getDevelopers())){
			foreach($information->getDevelopers() as $developer) {
				$xml_information_developer = $xml->createElement('developpeur', $developer->getName());
				$xml_information_developers->appendChild($xml_information_developer);
			}
		}

		// On ajoute les sorties
		$xml_information_releases = $xml->createElement('sorties');
		$xml_information->appendChild($xml_information_releases);

		if(!empty($information->getReleases())){
			foreach($information->getReleases() as $release) {
				$xml_information_release = $xml->createElement('sortie', $release->getDate());
				$xml_information_release->setAttribute("plateforme", $release->getPlateform()->getName());
				$xml_information_release->setAttribute("pays", $release->getCountry());
				$xml_information_releases->appendChild($xml_information_release);
			}
		}

		// On ajoute les genres
		$xml_information_genres = $xml->createElement('genres');
		$xml_information->appendChild($xml_information_genres);

		if(!empty($information->getGenres())){
			foreach($information->getGenres() as $genre) {
				$xml_information_genre = $xml->createElement('genre', $genre->getName());
				$xml_information_genres->appendChild($xml_information_genre);
			}
		}

		// On ajoute les themes
		$xml_information_themes = $xml->createElement('themes');
		$xml_information->appendChild($xml_information_themes);

		if(!empty($information->getThemes())){
			foreach($information->getThemes() as $theme) {
				$xml_information_theme = $xml->createElement('theme', $theme->getName());
				$xml_information_themes->appendChild($xml_information_theme);
			}
		}

		// On ajoute la classification
		$xml_information_classification = $xml->createElement('classification', $information->getClassification());
		$xml_information->appendChild($xml_information_classification);

		// On ajoute les modes
		$xml_information_modes = $xml->createElement('modes');
		$xml_information->appendChild($xml_information_modes);

		if(!empty($information->getModes())){
			foreach($information->getModes() as $mode) {
				$xml_information_mode = $xml->createElement('mode', $mode->getName());
				$xml_information_modes->appendChild($xml_information_mode);
			}
		}

		// On ajoute le nombre maximal de joueurs
		$xml_information_nbMax = $xml->createElement('nbMaximumJoueurs', $information->getNbMaxPlayer());
		$xml_information->appendChild($xml_information_nbMax);

		// On ajoute les sites
		$xml_information_sites = $xml->createElement('sites');
		$xml_information->appendChild($xml_information_sites);

		if(!empty($information->getWebSites())){
			foreach($information->getWebSites() as $site) {
				$xml_information_site = $xml->createElement('site', $site->getLink());
				$xml_information_site->setAttribute("pays", $site->getCountry());
				$xml_information_sites->appendChild($xml_information_site);
			}
		}

		// On ajoute les models economiques
		$xml_information_modelecos = $xml->createElement('modelesEconomiques');
		$xml_information->appendChild($xml_information_modelecos);

		if(!empty($information->getEcoModels())){
			foreach($information->getEcoModels() as $model_eco) {
				$xml_information_modeleco = $xml->createElement('modeleEconomique', $model_eco->getName());
				$xml_information_modelecos->appendChild($xml_information_modeleco);
			}
		}

		// On ajoute la description
		$xml_information_description = $xml->createElement('description', $information->getDescription());
		$xml_information->appendChild($xml_information_description);

		// On ajoute les models supports
		$xml_information_supports = $xml->createElement('supports');
		$xml_information->appendChild($xml_information_supports);

		if(!empty($information->getSupports())){
			foreach($information->getSupports() as $support) {
				$xml_information_support = $xml->createElement('support', $support->getName());
				$xml_information_supports->appendChild($xml_information_support);
			}
		}

		// On ajoute les tests
		$xml_tests = $xml->createElement('tests');
		$xml_game->appendChild($xml_tests);

		foreach($game->getTests() as $test) {
			$header = $test->getHeader();
			// On ajoute le test
			$xml_test = $xml->createElement('test');
			$xml_test->setAttribute("plateforme", $test->getPlateform()->getName());
			$xml_test->setAttribute("date-publication", $test->getPublicationDate());
			$xml_test->setAttribute("type", $test->getType());
			$xml_tests->appendChild($xml_test);

			// On ajoute l'entete
			$xml_test_header = $xml->createElement('entetes');
			$xml_test->appendChild($xml_test_header);

			// On ajoute l'auteur
			$xml_test_author = $xml->createElement('auteur', $header->getAuthor()->getDescription());
			$xml_test_author->setAttribute("id", $header->getAuthor()->getId());
			$xml_test_author->setAttribute("fonction", $header->getAuthor()->getFunction());
			$xml_test_header->appendChild($xml_test_author);

			// On ajoute le lien
			$xml_test_link = $xml->createElement('lien', $header->getLink());
			$xml_test_header->appendChild($xml_test_link);

			// On ajoute le titre
			$xml_test_title = $xml->createElement('titreTest', $header->getTitle());
			$xml_test_header->appendChild($xml_test_title);

			// On ajoute le résumé
			$xml_test_resume = $xml->createElement('resume', $header->getResume());
			$xml_test_header->appendChild($xml_test_resume);

			// On ajoute l'image à la une
			$xml_test_image1 = $xml->createElement('imageUne', $header->getImage()->getLink());
			$xml_test_image1->setAttribute("format", $header->getImage()->getFormat());
			$xml_test_header->appendChild($xml_test_image1);

			// On ajoute les Blocs
			$xml_content = $xml->createElement('contenu');
			$xml_test->appendChild($xml_content);

			foreach($test->getBlocs() as $bloc) {
				// On ajoute le bloc
				$xml_bloc = $xml->createElement('bloc', $bloc->getContent());
				$xml_bloc->setAttribute("type", $bloc->getType());
				if($bloc->getTitle() != null)
					$xml_bloc->setAttribute("titre", $bloc->getTitle());
				$xml_content->appendChild($xml_bloc);
			}

			// On ajoute les Notes
			$xml_marks = $xml->createElement('notes');
			$xml_test->appendChild($xml_marks);

			foreach($test->getMarks() as $mark) {
				// On ajoute la note
				$xml_mark = $xml->createElement('note', $mark->getContent());
				$xml_mark->setAttribute("type", $mark->getType());
				$xml_mark->setAttribute("valeur", $mark->getValue());
				$xml_marks->appendChild($xml_mark);
			}
		}

		$xml_opinions = $xml->createElement('opinions');
		$xml_game->appendChild($xml_opinions);

		foreach($game->getOpinions() as $opinion) {
			// On ajoute l'opinion'
			$xml_opinion = $xml->createElement('opinion');
			$xml_opinion->setAttribute("type", $opinion->getType());
			$xml_opinions->appendChild($xml_opinion);

			foreach($opinion->getRedactors() as $redactor) {
				// On ajoute le rédacteur
				$xml_redactor = $xml->createElement('redacteur');
				$xml_opinion->appendChild($xml_redactor);

				// On ajoute la note
				$xml_redactor_mark = $xml->createElement('noteGlobale', $redactor->getMark());
				$xml_redactor->appendChild($xml_redactor_mark);

				// On ajoute le testeur
				$xml_redactor_tester = $xml->createElement('testeur', $redactor->getTester());
				$xml_redactor->appendChild($xml_redactor_tester);

				// On ajoute le texte
				$xml_redactor_text = $xml->createElement('texte', $redactor->getText());
				$xml_redactor->appendChild($xml_redactor_text);
			}
		}

		$xml_medias = $xml->createElement('medias');
		$xml_game->appendChild($xml_medias);

		foreach($game->getMedias() as $media) {
			// On ajoute le media
			$xml_media = $xml->createElement('media');
			$xml_media->setAttribute("type", $media->getType());

			// On ajoute le titre du media
			$xml_media_title = $xml->createElement('titreMedia', $media->getTitle());
			$xml_media->appendChild($xml_media_title);

			// On ajoute le titre du media
			$xml_media_link = $xml->createElement('lienMedia', $media->getLink());
			$xml_media->appendChild($xml_media_link);

			// On ajoute les plateformes
			$xml_media_platforms = $xml->createElement('platforms');
			$xml_media->appendChild($xml_media_platforms);

			foreach($media->getPlateforms() as $plateform){
				// On ajoute les plateformes
				$xml_media_platform = $xml->createElement('platform', $plateform->getName());
				$xml_media_platform->setAttribute("type", $plateform->getName());
				$xml_media_platforms->appendChild($xml_media_platform);
			}

			// On ajoute la date
			$xml_media_date = $xml->createElement('date', $media->getDate());
			$xml_media->appendChild($xml_media_date);

			// On ajoute la description
			$xml_media_description = $xml->createElement('descriptionMedia', $media->getDescription());
			$xml_media->appendChild($xml_media_description);

			// On ajoute les plateformes
			$xml_media_tags = $xml->createElement('tags');
			$xml_media->appendChild($xml_media_tags);

			foreach($media->getTags() as $tag){
				// On ajoute les plateformes
				$xml_media_tag = $xml->createElement('tag', $tag->getType());
				$xml_media_tag->setAttribute("type", $tag->getType());
				$xml_media_tags->appendChild($xml_media_tag);
			}

			// On ajoute le nombre de vue
			$xml_media_nbView = $xml->createElement('nbVue', $media->getNbView());
			$xml_media->appendChild($xml_media_nbView);

			$xml_medias->appendChild($xml_media);
		}
		
		$xml->formatOutput = true;

		return $xml;
	}

	public static function stringToXML($data) {
		$xml = new DOMDocument();
		var_dump($data);
		$xml->loadXML($data);
		return $xml;
	}

	public static function XMLtoGame($xml){
		$XML_Games 	= $xml->getElementsByTagName('jeu');

		foreach($XML_Games as $XML_Game) {
			$game = new Game();
			$game->setIsActive(true);

			$XML_Informations = $xml->getElementsByTagName('informations');

			// On ajoute les informations du jeu
			foreach($XML_Informations as $XML_Information) {
				$information = new Information();
				$information->setName($XML_Information->getElementsByTagName('nom')->item(0)->nodeValue);
				$information->setNbMaxPlayer($XML_Information->getElementsByTagName('nbMaximumJoueurs')->item(0)->nodeValue);
				$information->setClassification($XML_Information->getElementsByTagName('classification')->item(0)->nodeValue);
				$information->setDescription($XML_Information->getElementsByTagName('description')->item(0)->nodeValue);

				// On ajoute les editeurs
				$listEditor = array();
				$XML_Editors = $XML_Information->getElementsByTagName('editeurs');
				foreach($XML_Editors->item(0)->getElementsByTagName('editeur') as $XML_Editor) {
					$editor = new Editor();
					$editor->setName($XML_Editor->nodeValue);
					array_push($listEditor, $editor);
				}
				$information->setEditors($listEditor);

				// On ajoute les developpeurs
				$listDevelopers = array();
				$XML_Developers = $XML_Information->getElementsByTagName('developpeurs');
				foreach($XML_Developers->item(0)->getElementsByTagName('developpeur') as $XML_Developer) {
					$developer = new Developer();
					$developer->setName($XML_Developer->nodeValue);
					array_push($listDevelopers, $developer);
				}
				$information->setDevelopers($listDevelopers);

				// On ajoute les sorties
				$listReleases = array();
				$XML_Releases = $XML_Information->getElementsByTagName('sorties');
				foreach($XML_Releases->item(0)->getElementsByTagName('sortie') as $XML_Release) {
					$release = new Release();
					$release->setDate($XML_Release->nodeValue);
					$release->setCountry($XML_Release->getAttribute('pays'));
					$release->setPlateform($XML_Release->getAttribute('plateforme'));
					array_push($listReleases, $release);
				}
				$information->setReleases($listReleases);

				// On ajoute les genres
				$listGenres = array();
				$XML_Genres = $XML_Information->getElementsByTagName('genres');
				foreach($XML_Genres->item(0)->getElementsByTagName('genre') as $XML_Genre) {
					$genre = new Genre();
					$genre->setName($XML_Genre->nodeValue);
					array_push($listGenres, $genre);
				}
				$information->setGenres($listGenres);

				// On ajoute les thèmes
				$listTheme = array();
				$XML_Themes = $XML_Information->getElementsByTagName('themes');
				foreach($XML_Themes->item(0)->getElementsByTagName('theme') as $XML_Theme) {
					$theme = new Theme();
					$theme->setName($XML_Theme->nodeValue);
					array_push($listTheme, $theme);
				}
				$information->setThemes($listTheme);

				// On ajoute les modes
				$listMode = array();
				$XML_Modes = $XML_Information->getElementsByTagName('modes');
				foreach($XML_Modes->item(0)->getElementsByTagName('mode') as $XML_Mode) {
					$mode = new Mode();
					$mode->setName($XML_Mode->nodeValue);
					array_push($listMode, $mode);
				}
				$information->setModes($listMode);

				// On ajoute les sites
				$listWebsite = array();
				$XML_Websites = $XML_Information->getElementsByTagName('sites');
				foreach($XML_Websites->item(0)->getElementsByTagName('site') as $XML_Website) {
					$website = new Website();
					$website->setLink($XML_Website->nodeValue);
					$website->setCountry($XML_Website->getAttribute('pays'));
					array_push($listWebsite, $website);
				}
				$information->setWebsites($listWebsite);

				// On ajoute les modeles économiques
				$listEcoModel = array();
				$XML_EcoModels = $XML_Information->getElementsByTagName('modelesEconomiques');
				foreach($XML_EcoModels->item(0)->getElementsByTagName('modeleEconomique') as $XML_EcoModel) {
					$ecoModel = new EcoModel();
					$ecoModel->setName($XML_EcoModel->nodeValue);
					array_push($listEcoModel, $ecoModel);
				}
				$information->setEcoModels($listEcoModel);

				// On ajoute les supports
				$listSupport = array();
				$XML_Supports = $XML_Information->getElementsByTagName('supports');
				foreach($XML_Supports->item(0)->getElementsByTagName('support') as $XML_Support) {
					$support = new Support();
					$support->setName($XML_Support->nodeValue);
					array_push($listSupport, $support);
				}
				$information->setSupports($listSupport);

				$game->setInformation($information);
			}

			// On ajoute les tests
			$listTest = array();
			$XML_Tests = $xml->getElementsByTagName('tests');
			foreach($XML_Tests->item(0)->getElementsByTagName('test') as $XML_Test) {
				$test = new Test();
				$test->setPublicationDate($XML_Test->getAttribute('date-publication'));
				$test->setType($XML_Test->getAttribute('type'));
				$test->setPlateform($XML_Test->getAttribute('plateforme'));

				// On ajoute les blocs
				$listBloc = array();
				$XML_Blocs = $xml->getElementsByTagName('contenu');
				foreach($XML_Tests->item(0)->getElementsByTagName('bloc') as $XML_Bloc) {
					$bloc = new Bloc();
					$bloc->setType($XML_Bloc->getAttribute('type'));
					$bloc->setTitle($XML_Bloc->getAttribute('title'));
					$bloc->setContent($XML_Bloc->nodeValue);
					array_push($listBloc, $bloc);
				}
				$test->setBlocs($listBloc);

				// On ajoute les notes
				$listMark = array();
				$XML_Marks = $xml->getElementsByTagName('notes');
				foreach($XML_Marks->item(0)->getElementsByTagName('note') as $XML_Mark) {
					$mark = new Mark();
					$mark->setType($XML_Mark->getAttribute('type'));
					$mark->setValue($XML_Mark->getAttribute('valeur'));
					$mark->setContent($XML_Mark->nodeValue);
					array_push($listMark, $mark);
				}
				$test->setMarks($listMark);

				// On ajoute l'entete
				$XML_Headers = $xml->getElementsByTagName('entetes');
				foreach($XML_Headers as $XML_Header) {
					$header = new Header();

					// On ajoute l'auteur
					$XML_Author = $XML_Header->getElementsByTagName('auteur');
					$author = new Author();
					$author->setFunction($XML_Author->item(0)->getAttribute('fonction'));
					$author->setDescription($XML_Author->item(0)->nodeValue);

					$header->setAuthor($author);

					// On ajoute le lien
					$header->setLink($XML_Header->getElementsByTagName('lien')->item(0)->nodeValue);
					// On ajoute le titre
					$header->setTitle($XML_Header->getElementsByTagName('titreTest')->item(0)->nodeValue);
					// On ajoute le resume
					$header->setResume($XML_Header->getElementsByTagName('resume')->item(0)->nodeValue);

					// On ajoute l'image
					$XML_Image = $XML_Header->getElementsByTagName('imageUne')->item(0);
					$image = new Image();
					$image->setFormat($XML_Image->getAttribute('format'));
					$image->setLink($XML_Image->nodeValue);
					$header->setImage($image);

					$test->setHeader($header);
				}
				$test->setMarks($listMark);

				array_push($listTest, $test);
			}

			$game->setTests($listTest);

			$listOpinion = array();
			$XML_Opinions = $xml->getElementsByTagName('opinions');
			foreach($XML_Opinions->item(0)->getElementsByTagName('opinion') as $XML_Opinion) {
				$opinion = new Opinion();
				$opinion->setType($XML_Opinion->getAttribute('type'));

				$listRedactor = array();
				foreach($XML_Opinion->getElementsByTagName('redacteur') as $XML_Redactor) {
					$redactor = new Redactor();
					$redactor->setMark($XML_Redactor->getElementsByTagName('noteGlobale')->item(0)->nodeValue);
					$redactor->setTester($XML_Redactor->getElementsByTagName('testeur')->item(0)->nodeValue);
					$redactor->setText($XML_Redactor->getElementsByTagName('texte')->item(0)->nodeValue);
					array_push($listRedactor, $redactor);
				}
				$opinion->setRedactors($listRedactor);

				array_push($listOpinion, $opinion);
			}

			$game->setOpinions($listOpinion);

			// On ajoute les médias
			$listMedia = array();
			$XML_Medias = $xml->getElementsByTagName('medias');
			foreach($XML_Medias->item(0)->getElementsByTagName('media') as $XML_Media) {
				$media = new Media();
				$media->setType($XML_Media->getAttribute('type'));
				$media->setTitle($XML_Media->getElementsByTagName('titreMedia')->item(0)->nodeValue);
				$media->setLink($XML_Media->getElementsByTagName('lienMedia')->item(0)->nodeValue);
				$media->setDate($XML_Media->getElementsByTagName('date')->item(0)->nodeValue);
				$media->setDescription($XML_Media->getElementsByTagName('descriptionMedia')->item(0)->nodeValue);
				$media->setNbView($XML_Media->getElementsByTagName('nbVue')->item(0)->nodeValue);
				
				//On ajoute les plateformes
				$listPlatform = array();
				$XML_Platforms = $XML_Game->getElementsByTagName('platforms');
				foreach($XML_Platforms->item(0)->getElementsByTagName('platform') as $XML_Platform) {
					$platform = new Platform();
					$platform->setName($XML_Platform->nodeValue);
					array_push($listPlatform, $platform);
				}

				$media->setPlateforms($listPlatform);

				// On ajoute les types Medias
				$listTag = array();
				$XML_Tags = $XML_Game->getElementsByTagName('tags');
				foreach($XML_Tags->item(0)->getElementsByTagName('tag') as $XML_Tag) {
					$tag = new Tag();
					$tag->setType($XML_Tag->nodeValue);
					array_push($listTag, $tag);
				}

				$media->setTags($listTag);

				array_push($listMedia, $media);
			}

			$game->setMedias($listMedia);
		}

		return $game;
	}
}