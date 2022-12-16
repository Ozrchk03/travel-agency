<?php
session_start();
require 'config.php';
require 'functions.php';
require 'lib/smarty/Smarty.class.php';


// init Smarty
$smarty = new Smarty;
//$smarty->force_compile = true;
//$smarty->debugging = true;
//$smarty->caching = true;
//$smarty->cache_lifetime = 120;
$connectStr = sprintf("%s:host=%s;dbname=%s;charset=%s", DB_SYSTEM, DB_HOST, DB_NAME, DB_CHARSET);

try{
    $pdo = new PDO($connectStr, DB_LOGIN, DB_PASSWORD);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}catch (PDOException $e){
    echo $e->getMessage();
}


if(getSessVar('userID')){
    $smarty->assign('userLoggedIn', 1);
}
else{
    $smarty->assign('userLoggedIn', 0);
}
