{* smarty *}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <script src="js/jquery.min.js"></script>
    <script>
        const pageType='{$pageType}';
        const loggedIn=parseInt({$userLoggedIn});
    </script>
</head>
<body>
<div class="blackout-bg"></div>

<div class="profile-page">
    <div class="profile-page-header">
        <div class="content-align">
            <div>
                <div>ОСОБИСТИЙ АКАУНТ</div>
                <div id="logOut">Вийти</div>
            </div>
            <div id="close-profile-x" style="cursor: pointer"><img class="close-img" src="images/close-white.png"></div>
        </div>
    </div>
    <div class="content-align">
        <div class="profile-data">
            <div id="profile-avatar">
                <img id="profile-avatar-img" src="images/photoUser.png">
            </div>
            <div id="profile-name">
                <div id="profile-name-surname">{$surname} {$forename}</div>
            </div>
        </div>

        <div id="profile-info-container">
            <div id="profile-line"></div>
            <div class="profile-info">
                <div class="user-personal-info">
                    <div class="user-phoneNum">
                        <div class="user-info-title"><h3>Номер телефону</h3></div>
                        <div class="user-info-container-phone ">
                            <div id="user-phoneNum">{$phone}</div>
{*                            <div class="change" id="change-phone">Змінити</div>*}
                        </div>
{*                        <div class="user-info-container-change-phone user-info-hidden">*}
{*                            <input type="text" name="phone" id="changed-phone" placeholder="Введіть новий номер">*}
{*                            <div class="change" id="confirm-phone">Підтвердити</div>*}
{*                        </div>*}
                    </div>

                    <div class="user-email">
                        <div class="user-info-title"><h3>E-mail</h3></div>
                        <div class="user-info-container-email">
                            <div id="user-email">{$email}</div>
{*                            <div class="change" id="change-email">Змінити</div>*}
                        </div>
{*                        <div class="user-info-container-change-email user-info-hidden">*}
{*                            <input type="email" name="email" id="changed-email" placeholder="Введіть нову пошту">*}
{*                            <div class="change" id="confirm-email">Підтвердити</div>*}
{*                        </div>*}
                    </div>
                </div>

                <div class="ordered-tours">
                    <div id="ordered-tours-title"><h3>Заброньовані тури</h3></div>
                    <div class="ordered-tours-list">
                        {foreach $cards as $card}
                            <div class="ordered-tour-content">
                                <span class="show-full-tour-info">
                                    <span class="ordered-tour" full-card-id="full_card_{$card->getId()}">{$card->getCountryName()} - {$card->getCardName()}</span>
                                    <span class="arrow-show-full-tour-info"><img src="images/input-arrow.png" class="input-arrow"></span>
                                </span>
                                <span class="cancel-tour" tour-id="{$card->getId()}">Відмінити</span>

                                <div class="full-tour hidden" id="full_card_{$card->getId()}">
                                    <div class="full-tour-info">
                                        <div><h4>Тривалість:</h4><span>{$card->getDaysCount()}</span></div>
                                        <div><h4>Дата відправлення:</h4><span>{$card->getDepartureDate()}</span></div>
                                        <div><h4>Час відправлення:</h4><span>{$card->getDepartureTime()}</span></div>
                                        <div><h4>Дата прибуття:</h4><span>{$card->getReturnDate()}</span></div>
                                        <div><h4>Час прибуття:</h4><span>{$card->getReturnTime()}</span></div>
                                        <div><h4>Місто відправлення / прибуття:</h4><span>{$card->getDepartureCityName()}</span></div>
                                        <div><h4>Місце відправлення / прибуття:</h4><span>{$card->getDeparturePlaceName()}</span></div>
                                        <div><h4>Ціна:</h4><span>{$card->getFullPrice()} (людина)</span></div>
                                    </div>
                                </div>

                                <div class="tour-line"></div>

                            </div>


                        {/foreach}
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>

<div class="cancel-tour-alert alert-hidden">
    <div class="cancel-tour-alert-container">
        <div class="cancel-tour-alert-text">Ви дійсно бажаєте відмінити тур?</div>
        <div class="cancel-tour-alert-buttons">
            <div class="cancel-tour-alert-button"><button id="cancel-tour-alert-button-yes"><span>Так</span></button></div>
            <div class="cancel-tour-alert-button"><button id="cancel-tour-alert-button-no"><span>Ні</span></button></div>
        </div>
    </div>
</div>

<script src="js/user.js"></script>
</body>
</html>

