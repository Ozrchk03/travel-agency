<?php

require_once 'includes.php';
require_once 'classes/Country.php';

$smarty->assign("headerBG", '');

$countries = getCountry();

$smarty->assign('countries', $countries);
$smarty->display('countries.tpl');