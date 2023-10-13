<?php
class DataLayer {
	// private ?PDO $conn = NULL; // le typage des attributs est valide uniquement pour PHP>=7.4

	private  $connexion = NULL; // connexion de type PDO   compat PHP<=7.3

	/**
	 * @param $DSNFileName : file containing DSN
	 */
	function __construct(string $DSNFileName){
		$dsn = "uri:$DSNFileName";
		$this->connexion = new PDO($dsn);
		// paramètres de fonctionnement de PDO :
		$this->connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // déclenchement d'exception en cas d'erreur
		$this->connexion->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_ASSOC); // fetch renvoie une table associative
		// réglage d'un schéma par défaut :
		$this->connexion->query('set search_path=coursetw2');
	}

	/**
	 * Liste des étapes
	 * @return array tableau d'étapes
	 * chaque étape comporte les clés :
		* numero : entier (identifiant)
		* nom : chaîne
		* distance : nombre entier (en km)
		* date : date
	 */
	function getEtapes(): array {
		$sql = "select numero, nom, distance, date from etapes order by numero";
		$stmt = $this->connexion->prepare($sql);
		$stmt->execute();
		$res = $stmt->fetchAll();
		return $res;
		/* à compléter */
	}
	/**
	 * Liste des équipes
	 * @return array tableau d'équipes
	 * chaque équipe comporte les clés :
		* nom: chaîne (identifiant)
		* directeur : chaîne
		* couleur : chaîne
	 */
	function getEquipes(): array {
		$sql = "select nom, directeur, couleur from equipes";
		$stmt = $this->connexion->prepare($sql);
		$stmt->execute();
		$res = $stmt->fetchAll();
		return $res;
		/* à compléter */
	}
	/**
	 * Liste des coureurs
	 * @return array tableau de coureurs
	 * chaque coureur comporte les clés :
		* dossard : entier (identifiant)
		* nom : chaîne
		* equipe : chaîne
		* taille : nombre entier (en cm)
	 */
	function getCoureurs(?string $equipe=NULL, ?string $subst_nom=NULL): array {
		$sql = "select dossard, nom, equipe, taille from coureurs";
		$conds =[];  // tableau contenant les code SQL de chaque condition à appliquer
		$binds=[];   // association entre le nom de pseudo-variable et sa valeur
		if ($equipe !== NULL){
			$conds[] = "equipe = :equipe";
			$binds[':equipe'] = $equipe;
		}
		if ($subst_nom !== NULL){
			$conds[] = "nom ILIKE(:motif)";
			$binds[':motif'] = "%$subst_nom%";
		}
		if (count($conds)>0){ // il y a au moins une condition à appliquer ---> ajout d'ue clause where
			$sql .= " where ". implode(' and ', $conds); // les conditions sont reliées par AND
		}
		$stmt = $this->connexion->prepare($sql);
		$stmt->execute($binds);
		$res= $stmt->fetchAll();
		return $res;
	}



	function getClassement(int $etape): array {

		$sql = <<<EOD
			select etapes.nom as nom_etape,etape,dossard, chrono, coureurs.nom, rank() over(order by chrono) as rang
			from temps
			join etapes on temps.etape=etapes.numero
			join coureurs using (dossard)
			where etape= :etape;
		EOD;
		$stmt = $this->connexion->prepare($sql);
		$stmt->bindValue(":etape", $etape);
		$stmt->execute();
		$res = $stmt->fetchAll();
		return $res;
		/* à compléter */
	}





}
?>
