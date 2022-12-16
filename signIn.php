<?php
require_once 'includes.php';
require_once 'classes/User.php';
global $smarty;


if(getSessVar('userID')){
    header("Location: profile.php");
    exit();
}

if(isset($_POST['action']) && $_POST['action'] == 'signIn') {
    $email = getVar('email', 128);
    $password = getVar('password', 100);

    $user = new User();
    $user->setEmail($email);
    $user->setPassword($password);

    if($user->signIn()){
        setSessVar('userID', $user->getId());
        setSessVar('forename', $user->getForename());
        setSessVar('surname', $user->getSurname());
        setSessVar('phone', $user->getPhone());
        setSessVar('email', $user->getEmail());

        header("Location: index.php");
        exit();
    }

    $smarty->assign('signIn_error_msg', 'Введені пароль або email не є дійсними');
}


$smarty->display('signIn.tpl');