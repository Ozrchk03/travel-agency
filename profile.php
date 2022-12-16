<?php
require_once 'includes.php';
require_once 'classes/Tour.php';
global $smarty;


if(getVar('logout')){
    session_unset();
    header("Location: index.php");
    exit();
}

if(!getSessVar('userID')){
    header("Location: signIn.php");
    exit();
}

if(getVar('action')=='unbook'){
    $tourID = getVar('tourID');

    $sql="
        DELETE FROM bookedtours
        WHERE user_id =:user_id
        AND tour_id =:tour_id; 
    ";

    $params = [
        'user_id' => getSessVar('userID'),
        'tour_id' => $tourID
    ];

    $stmt = $pdo->prepare($sql);
    $res = $stmt->execute($params);
    echo (int)$res;
    exit();
}

if(getVar('action') == "book"){
    $tourID = (int)getVar('tourID');

    $sql = 'INSERT INTO bookedtours( user_id, tour_id) VALUES (:user_id, :tour_id)';

    $params = [
        'user_id' => getSessVar('userID'),
        'tour_id' => $tourID
    ];

    $stmt = $pdo->prepare($sql);
    $res = $stmt->execute($params);
    echo (int)$res;
    exit();
}


if(getVar('action') == "reviewAdd"){
    $desc = getVar('desc');
    $score = (int)getVar('score');

    $sql = 'INSERT INTO review(user_id, description, score) VALUES (:user_id, :desc, :score)';

    $params = [
        'user_id' => getSessVar('userID'),
        'desc' => $desc,
        'score' => $score
    ];

    $stmt = $pdo->prepare($sql);
    $res = $stmt->execute($params);
    echo (int)$res;
    exit();
}


$sql = sprintf("SELECT 
            t.id,
            t.country_id,
            co.name as country_name,
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
        WHERE t.id in (SELECT tour_id FROM bookedtours WHERE user_id=%d)
        ORDER BY t.departure_time     
        ", getSessVar('userID'));

$result = $pdo->query($sql);

$result->setFetchMode(PDO::FETCH_CLASS, "Tour");
$cards = [];
while ($row = $result->fetch()) {
    $cards[] = $row;
}


$smarty->assign('forename', getSessVar('forename'));
$smarty->assign('surname',  getSessVar('surname'));
$smarty->assign('phone',  getSessVar('phone'));
$smarty->assign('email',  getSessVar('email'));
$smarty->assign('cards',  $cards);



$smarty->display('profile.tpl');
