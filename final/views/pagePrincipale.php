<?php

?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">
  <head>
    <meta charset="UTF-8"/>
    <title>TDF 2020</title>
    <link rel="stylesheet" type="text/css" href="style_final.css" />
    <script src="js/fetchUtils.js"></script>
    <script src="js/pagePrincipale.js"></script>


  </head>
<body >
  <header>
    <h1>
    Tour de France 2022
    </h1>
  </header>

  <section id="contenu">
    <section id="parcours">
      <h2>Parcours</h2>
      <ol id="etapes">
        <?php
          require_once('lib/fonctions_html.php');
          require_once('lib/initDataLayer.php');
          echo createEtapeItems($data->getEtapes()); //à compléter ?>
      </ol>
      <table id="classement">
        <!-- créer  en JS un élément <caption> contenant le nuéro et nom de l'étape  -->
        <!-- créer  en JS un <tbody> contenant les lignes du classement  :
             rang, temps, nom du coureur, dossard
           -->
      </table>
    </section>
    <section id="engages">
      <h2>Engagés</h2>
      <div id="choix">
        <form id="form_coureurs" action="">
          <fieldset>
            <legend>Choisir</legend>
            <label for="equipe_field">Équipe</label>
            <select name="equipe" id="equipe_field">
                <option value="" selected=""
                data-nom="PicsouBank"
                data-nom="SuperCarburant"
                data-nom="LavePlusBlanc"
                >
                  (toutes)
                </option>
                <!-- les autres options seront crées en JS -->
            </select>
            <label for="nom_field">Nom:</label>
            <input type="text" name="subst_nom" id="nom_field" />
            <button type="submit">Afficher la liste</button>
          </fieldset>
        </form>
      </div>
      <ul id="coureurs"><!-- contenu à générer en JS--></ul>
    </section>
  </section>
  <footer></footer>
</body>
</html>
