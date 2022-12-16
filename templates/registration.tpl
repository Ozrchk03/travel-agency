<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <script src="js/jquery.min.js"></script>
</head>
<body>
<div class="profile-page registration-page">
    <div class="content-align">
        <div class="close-btn-black" id="close-profile-x">
            <img class="close-img" src="images/close-black.png">
        </div>
        <div class="form-content">
            <div class="form reg-form">
                <form method="post" action="registration.php" id="reg-form">
                <input type="hidden" name="action" value="register">
                <div class="sign">РЕЄСТРАЦІЯ</div>
                <div class="error-msg">{$registration_error_msg}</div>

                <div class="input-group">
                    <div class="input-section">
                        <label>
                            <span>
                                <input type="text" class="input-text registration right-margin" id="surname-registration" name="surname" placeholder="Прізвище" maxlength="32">
                            </span>
                            <span>
                                <input type="text" class="input-text registration" id="forename-registration" name="forename" placeholder="Ім'я" maxlength="32">
                            </span>
                        </label>
                    </div>
                    <div class="input-section">
                        <label>
                            <input type="text" class="input-text registration right-margin" id="phoneNum-registration" name="phoneNum" placeholder="Номер телефону" maxlength="16">
                            <input type="email" class="input-text registration" id="email-registration" name="email" placeholder="E-mail" maxlength="128">
                        </label>
                    </div>
                    <div class="input-section">
                        <label>
                            <input type="password" class="input-text" id="password-singIn" name="password-singIn" placeholder="Пароль">
                        </label>
                        <div class="btn-show-hide-password">
                            <div id="show-password"><img src="images/show-password.png"></div>
                            <div id="hide-password"><img src="images/hide-password.png"></div>
                        </div>

                    </div>
                </div>
                <button id="sign-up" class="btn-action">Зареєструватись</button>
                </form>
            </div>
        </div>
    </div>


</div>
<script src="js/user.js"></script>

</body>
</html>