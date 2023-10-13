<?php
set_include_path('..'.PATH_SEPARATOR);
require_once('lib/common_service.php');
require_once('lib/initDataLayer.php');

try{
    $equipe = $_GET["equipe"];
    $subst_nom = $_GET["subst_nom"];
    $coureurs= $data->getCoureurs($equipe, $subst_nom);
    produceResult($coureurs);
}
catch(PDOException $e){
    produceError($e->getMessage());
}


?>
