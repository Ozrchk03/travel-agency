<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign in</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <script src="js/jquery.min.js"></script>

</head>
<body>
<div class="profile-page sign-in-page">
    <div class="content-align">
        <div class="close-btn-black" id="close-profile-x">
            <img class="close-img" src="images/close-black.png">
        </div>
        <div class="form-content">
            <form id="signin-form" action="signIn.php" method="post">
                <input type="hidden" name="action" value="signIn">
            <div class="form">
                <div class="sign">ВХІД ДО ОСОБИСТОГО КАБІНЕТУ</div>
                <div class="error-msg">{$signIn_error_msg}</div>
                <div class="input-group">
                    <label>
                        <input type="email" maxlength="128" name="email" class="input-text" id="email-singIn" placeholder="E-mail">
                    </label>
                    <div class="password-signIn-container">
                        <label>
                            <input type="password" maxlength="100" name="password" class="input-text" id="password-singIn" placeholder="Пароль">
                        </label>
                        <div class="btn-show-hide-password">
                            <div id="show-password"><img src="images/show-password.png"></div>
                            <div id="hide-password"><img src="images/hide-password.png"></div>
                        </div>
                    </div>
                </div>
                <button id="sign-in" class="btn-action">Увійти</button>
                <div style="display: flex; justify-content: right">
                    <a href="registration.php"><div id="registration-link">Реєстрація</div></a>
                </div>
            </div>
            </form>
        </div>
    </div>


</div>
<script src="js/user.js"></script>
</body>
</html>