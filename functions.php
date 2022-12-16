<?php
function getCountry($countryID=0, $countryName=''){
    global $pdo;

    $whereCondition = '';

    if(strlen($countryName)){
        $whereCondition = " WHERE c.name = '" . $countryName . "'";
    }
    elseif($countryID > 0){
        $whereCondition = " WHERE c.id = " . $countryID;
    }

    $sql="
    SELECT 
        c.id,
        c.name,
        c.region_id,
        c.main_image,
        c.description,
        r.name AS region_name       
    FROM
        country c 
    LEFT JOIN region r ON c.region_id = r.id " . $whereCondition;

    $result = $pdo->query($sql);
    $result->setFetchMode(PDO::FETCH_CLASS, "Country");
    $countries = [];
    while ($country = $result->fetch()) {
        if($countryID > 0){
            return $country;
        }

        $countries[] = $country;
    }

    return $countries;
}

function getReview(){
    global $pdo;

    $sql="
            SELECT 
                r.id,
                r.user_id,
                r.description,
                r.score,
                u.surname, 
                u.forename 
            FROM review r 
            LEFT JOIN user u ON r.user_id = u.id
    ";

    $result = $pdo->query($sql);
    $result->setFetchMode(PDO::FETCH_CLASS, "Review");
    $reviews = [];
    while($review = $result->fetch()){
        $reviews[] = $review;
    }

//    echo "<pre>";
//    print_r($reviews);

    return $reviews;
}

function getVar($name, $maxLen=0, $defaultVal=''){

    if( !isset($_REQUEST[$name]) ) {
        return $defaultVal;
    }

    $value = trim($_REQUEST[$name]);

    if($maxLen){
        return substr($value, 0, $maxLen);
    }

    return $value;
}

function getSessVar($name, $defaultVal=''){

    if( !isset($_SESSION[$name]) ) {
        return $defaultVal;
    }

    return $_SESSION[$name];
}


function setSessVar($name, $value){
    $_SESSION[$name] = $value;
}


function getPDOObject(){
    global $pdo;
    return $pdo;
}

function interpolateQuery($query, $params) {
    $keys = array();
    $values = $params;

    # build a regular expression for each parameter
    foreach ($params as $key => $value) {
        if (is_string($key)) {
            $keys[] = '/:'.$key.'/';
        } else {
            $keys[] = '/[?]/';
        }

        if (is_string($value))
            $values[$key] = "'" . $value . "'";

        if (is_array($value))
            $values[$key] = "'" . implode("','", $value) . "'";

        if (is_null($value))
            $values[$key] = 'NULL';
    }

    $query = preg_replace($keys, $values, $query);

    return $query;
}


function getCollageImgName($mainImgName){
    $mainImage = COUNTRY_IMAGES_DIR . $mainImgName;
    $pathInfo = pathinfo($mainImage);

    return $collageImage = sprintf("%s/%s", COLLAGES_DIR, $pathInfo["filename"]);
}


