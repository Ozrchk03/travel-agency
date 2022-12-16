{include file="header.tpl"}

<!--            main body-->
<div class="content-align">
    <!--            popular tours-->
    <div id="popularTours" class="popular-tours" >
        <div class="header">Популярні тури</div>
        {include file="card.tpl"}
    </div>
    <!--            end popular tours-->

    <!--            about company-->
    <div id="aboutCompany" class="company">
        <div class="img-aboutComp" data-aos="fade-right" data-aos-once="true">
            <img src="images/aboutCompany.jpg" class="ac-img">
            <div id="aboutHint-1" class="aboutHint"><span class="number-ac">200</span><span>+</span><br>напрямкiв</div>
            <div id="aboutHint-2" class="aboutHint"><span class="number-ac">3000</span><span>+</span><br>туристів</div>
            <div id="aboutHint-3" class="aboutHint"><span class="number-ac">400</span><span>+</span><br>готелів</div>
        </div>
        <div class="info" data-aos="fade-left" data-aos-once="true">
            <div class="header">Про компанію</div>
            <div class="text">
                Наша компанія створена в 2019 році. За цей проміжок
                часу ми зробили щасливими вже більше ніж 3000 наших туристів. Кожного дня до нас звертаються люди
                з проханням зробити їхні вихідні якомого начисеними
                та цікавими, тому що ми вміємо це організувати. Наша компанія має більше ніж 200 напрямків, тому відправимо вас туди, куди ви тільки захочете. А також підберемо для вас найкраще проживання, адже ми співпрацюємо
                з більше ніж 400 готелями.
                <br>
                <br>
                Хочете зробити свій відпочинок незабутнім?
                <br>
                Тоді вам до нас.
            </div>
        </div>


    </div>
    <!--            end about company-->

    <!--            reviews-->
    <div class="reviews" id="reviews">
            <div class="header review-title">Відгуки</div>
            <span class="arrow-btn-review">
                <div class="arrow-btn" id="prev-reviews"><img src="images/arrow-prev.png"></div>
                <div class="arrow-btn" id="next-reviews"><img src="images/arrow-next.png"></div>
            </span>


        <div class="carousel" id="carousel-review">
            <div class="blocks">
                {foreach $reviews as $review}
                    <div class="review-block">
                        <div class="review-img">
                            <img src="images/bg-review.png" class="review-bg">
                        </div>
                        <div class="quotes">
                            <img src="images/quotes.png" class="img-quotes">
                        </div>
                        <div class="review-text">
                            {$review->getDescription()}
                        </div>
                        <div class="user-name">
                            {$review->getFullName()}
                        </div>
                        <div class="review-avatar">
                            <div class="avatar-img">
                                <img class="avatar" src="images/photoUser.png">
                            </div>
                            <div class="rate">
                                <div class="star">
                                    <img src="images/avatar/yellow-star-with-black-background-yellow-star-clipart-1034755.png" class="star-img">
                                    <span style="font-size: 10px">{$review->getScore()}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                {/foreach}

            </div>

        </div>

        <div style="display: flex; justify-content: center; position: relative;">

            <div class="leave-review-section">
                <div class="leave-review-container">
                    <div id="leave-review-header">
                        <div class="close-btn-black" id="add-review-win-close"><img src="images/close-black.png"></div>
                    </div>
                    <div>
                        <label for="user-review">
                            <textarea name="review" maxlength="256" id="user-review" placeholder="Напишіть свій відгук"></textarea>
                        </label>
                    </div>
                    <select id="user-score">
                        <option value="1">1 зірочка</option>
                        <option value="2">2 зірочки</option>
                        <option value="3">3 зірочки</option>
                        <option value="4">4 зірочки</option>
                        <option value="5">5 зірочок</option>
                    </select>
                    <button class="btn-review" id="btn-review-add">Надіслати відгук</button>
                </div>
            </div>

            <div class="leave-review-success">
                <div class="leave-review-container">
                    <div id="leave-review-header">
                        <div class="close-btn-black" id="add-review-success-win-close"><img src="images/close-black.png"></div>
                    </div>
                    <div class="review-text">
                        Ваш відгук надіслано!
                    </div>
                    <div>
                        <img id="img-review-success" src="images/addReviewSuccess.jpg">
                    </div>
                </div>
            </div>

            <button class="btn-review" id="btn-review">Залишити свій відгук</button>
        </div>

    </div>
    <!--            end reviews-->

    <!--            contacts-->
    <div class="contacts " id="contacts">
        <div class="header">Контакти</div>
        <!--            section 1-->
        <div class="contact-content">
            <div class="ukr-number">
                <div class="num-title">Номер телефону</div>
                <div class="ukrFlag">
                    <img src="images/ua.png" class="ukrFlag-img">
                    <div class="number">+380 (67) 187 - 45 - 75</div>
                </div>
            </div>
            <!--            section 2-->
            <div class="social-media-content">
                <div class="num-title">Соціальні мережі</div>
                <div class="icons-sm">
                    <div class="sm-content">
                        <img class="bi-instagram" id="inst-sm" src="images/inst-icon-blue.png">
                        <div class="number">@travel.agency</div>
                    </div>
                    <div class="sm-content">
                        <img class="facebook" id="fb-sm" src="images/fb-icon-blue.png">
                        <div class="number">@travel.agency</div>
                    </div>

                    <div class="sm-content">
                        <img class="youtube" id="yt-sm" src="images/yt-icon.png">
                        <div class="number">@travel.agency</div>
                    </div>
                </div>
            </div>
            <!--            section 3-->
            <div class="email">
                <div class="num-title">E-mail</div>
                <div class="email-content">
                    <div class="number padding-num">travel.agency@gmail.com</div>
                    <div class="number padding-num">travel.agency@ukr.net</div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--            end contacts-->

<script src="js/index.js"></script>
<script src="js/cards.js"></script>



{include file="footer.tpl"}