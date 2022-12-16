<?php
require_once 'includes.php';
require_once 'classes/User.php';
global $smarty;


if(isset($_POST['action']) && $_POST['action'] == 'register'){

    $forename = getVar('forename', 32);
    $surname = getVar('surname', 32);
    $phoneNum = getVar('phoneNum', 16);
    $email = getVar('email', 128);
    $password = getVar('password-singIn', 100);

    $user = new User();
    $user->setForename($forename);
    $user->setSurname($surname);
    $user->setEmail($email);
    $user->setPassword($password);
    $user->setPhone($phoneNum);

//    $user->setForename($forename);
    if( $user->create() ){
        header("Location: signIn.php");
        exit();
    }

    $smarty->assign('registration_error_msg', 'Нажаль ми не змогли вас зареєструвати, тому що такий email вже існує.');
}



$smarty->display('registration.tpl');