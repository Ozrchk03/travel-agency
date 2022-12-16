<?php

require_once 'includes.php';
require_once 'classes/Tour.php';
require_once 'classes/Country.php';

//$str = "А вот оно просетапилось из PHP";
//$smarty->assign("headerBG", 'bg-img-main');
$smarty->assign("pageType", 'main');

$countryID = 0;
$countryName = '';

if( is_numeric($_GET['cid'])){
    $countryID = (int)$_GET['cid'];
}
elseif(isset($_GET['srch'])){
    $countryName = substr(trim($_GET['srch']), 0, 100);
}

if($countryID > 0){
    $country = getCountry($countryID);
}elseif (strlen($countryName)){
    $countries = getCountry(0, $countryName);
    if(!count($countries)){
        showNotFoundPage();
    }
    $country = $countries[0];
    $countryID = $country->getID();
}else{
    showNotFoundPage();
}


// Get List of country tours
$sql = "SELECT 
            t.id,
            t.country_id,
            co.name as country_name,
            co.main_image as country_image,
            t.name,
            t.city_id,
            ci.name as city_name,
            t.departure_city_id,
            cid.name as departure_city_name,
            t.departure_time,
            t.departure_place,
            t.return_time,
            t.price,
            t.currency_id,
            cu.sign AS currency_sign,
            t.description,
            t.main_image,
            t.hot,
            t.type
        FROM 
            tour t
        LEFT JOIN country co ON t.country_id=co.id
        LEFT JOIN city ci ON t.city_id=ci.id
        LEFT JOIN city cid ON t.departure_city_id=cid.id
        LEFT JOIN currency cu ON t.currency_id=cu.id
        WHERE t.country_id = " . $countryID;

$result = $pdo->query($sql);

$result->setFetchMode(PDO::FETCH_CLASS, "Tour");
$cards = [];
while ($row = $result->fetch()) {
    $cards[] = $row;
}


$smarty->assign('cards', $cards);
$smarty->assign('mainHeader', true);

$mainImage = COUNTRY_IMAGES_DIR . $country->getMainImage();
$pathInfo = pathinfo($mainImage);

$mainImageCaption = sprintf("%s/%s.png", CAPTION_IMAGES_DIR, $pathInfo["filename"]);

$description = $country->getDescription();

//$collageImage = sprintf("%s/%s", COLLAGES_DIR, $pathInfo["filename"]);

$region = $country->getRegionName();

$smarty->assign("headerBGImage", $mainImage);
$smarty->assign("main_image_caption", $mainImageCaption);
$smarty->assign("country_description", $description);
//$smarty->assign("collage_image", $collageImage);
$smarty->assign("region_name", $region);
$smarty->assign("collage_image", getCollageImgName($country->getMainImage()));

$smarty->display('country.tpl');


function showNotFoundPage(){
    global $smarty;
    $smarty->display('notFound.tpl');
    exit();
}