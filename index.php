<?php

require_once 'includes.php';
require_once 'classes/Tour.php';
require_once 'classes/Review.php';

$smarty->assign("headerBG", 'bg-img-main');
$smarty->assign("pageType", 'main');

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
        ORDER BY t.departure_time     
        ";

$result = $pdo->query($sql);

$result->setFetchMode(PDO::FETCH_CLASS, "Tour");
$cards = [];
while ($row = $result->fetch()) {
    $cards[] = $row;
}



$mainDescription ='Ми туристична компанія, яка обожнює те, що робить,
адже кожного дня ми бачимо щасливі очі наших клієнтів та чуємо від них безліч захоплених слів від подорожей, які були обрані
та надані нашою компанією';

$smarty->assign('cards', $cards);
$smarty->assign('reviews', getReview());
$smarty->assign('mainHeader', true);
$smarty->assign("main_image_caption", 'images/captions/travel.png');
$smarty->assign("country_description", $mainDescription);
$smarty->assign("region_name", 'COMPANY');
//$smarty->assign("collage_image", getCollageImgName($cards[country_image]->getMainImage()));


$smarty->display('index.tpl');

