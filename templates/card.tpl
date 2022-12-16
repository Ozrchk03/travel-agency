{* smarty *}
    <div style="display: flex;">
        <div class="switch-button">
            <input class="switch-button-checkbox" type="checkbox">
            <label class="switch-button-label" for=""><span class="switch-button-label-span">Всі</span></label>
        </div>
    </div>
    <div class="choose-tour">
        <span class="input-title" id="input-date">Дата <img class="input-arrow" src="images/input-arrow.png"></span>
        <span class="input-title type-input" id="input-type">Вид <img class="input-arrow" src="images/input-arrow.png"></span>
        <ul class="input-type-list">
            <li><div>Пригоди</div></li>
            <li><div>Релакс</div></li>
        </ul>
        <span class="input-title" id="input-price">Ціна <img class="input-arrow" src="images/input-arrow.png"></span>
        <div class="slider-container">
            <span class="min-price">$0</span>
            <span class="max-price">$500</span>
            <input type="range" min="10" max="500" value="250" class="slider" id="slider" step="10">
            <div id="current-price"></div>
        </div>
        <span class="input-title" id="input-clear-filter">Очистити фільтри</span>
    </div>
    <div class="carousel" id="carousel-card" >
        <div class="arrow-btn" id="prev-cards"><img src="images/arrow-prev.png"></div>
        <div class="cards" >
            {foreach $cards as $card}
                <div class="card {if !$card->getHot()}nothot{/if}" data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="700" data-aos-once="true">
                    <input type="hidden" class="card-date"  value="{$card->getCompareDate()}">
                    <input type="hidden" class="card-type"  value="{$card->getType()}">
                    <input type="hidden" class="card-price" value="{$card->getPrice()}">
                    <div>
                        <div>
                            <img src="images/cards/{$card->getMainImage()}" class="card-img">
                        </div>
                        <div class="card-info">
                            <div>
                                <div class="card-info-cat {$card->getCardTypeClass()}">{$card->getType()}</div>
                                <div class="card-info-days">{$card->getDaysCount()}</div>
                            </div>
                            <div><h2>{$card->getCardName()}</h2></div>
                            <div>
                                <div class="person"><span class="price">{$card->getFullPrice()}</span> / Людина</div>
                                <div class="buttonOrder"><button full-card-id="full_card_{$card->getId()}" class="btn-toOrder">Переглянути</button></div>
                            </div>
                        </div>
                    </div>
                    <div class="card-data">
                        <div class="date">{($card->getDepartureDate()|upper)}</div>
                    </div>
                </div>
                <div class="full_card hidden" id="full_card_{$card->getId()}">
                    <div class="full_card_close_btn" full-card-id="full_card_{$card->getId()}"><img class="close-img" src="images/close-black.png"></div>
                    <div class="card_name"><h3>{$card->getCardName()}</h3></div>
                    <div>
                        <div class="full-card-img"><img id="card-img" src="images/cards/{$card->getMainImage()}"></div>
                        <div class="full-card-info">
                            <div><h4>Тривалість:</h4><span>{$card->getDaysCount()}</span></div>
                            <div><h4>Вид:</h4><span>{$card->getType()}</span></div>
                            <div><h4>Дата відправлення:</h4><span>{$card->getDepartureDate()}</span></div>
                            <div><h4>Час відправлення:</h4><span>{$card->getDepartureTime()}</span></div>
                            <div><h4>Дата прибуття:</h4><span>{$card->getReturnDate()}</span></div>
                            <div><h4>Час прибуття:</h4><span>{$card->getReturnTime()}</span></div>
                            <div><h4>Місто відправлення / прибуття:</h4><span>{$card->getDepartureCityName()}</span></div>
                            <div><h4>Місце відправлення / прибуття:</h4><span>{$card->getDeparturePlaceName()}</span></div>
                            <div><h4>Ціна:</h4><span>{$card->getFullPrice()} (людина)</span></div>
                            <div id="tour-description"><h4>Опис:</h4> <div id="card-description">{$card->getDescription()}</div></div>
                            <div id="book-tour"><button class="btn-book-tour" book-tour-id="{$card->getId()}">Забронювати</button></div>
                        </div>
                    </div>
                    <div class="successful-booking-alert" id="booking-success-win-{$card->getID()}">
                        <div class="booking-alert-close-btn"><img class="close-img" src="images/close-black.png"></div>
                        <div class="sb-content">
                            <div class="sb-caption">
                                <div class="sb-title">
                                    <h3>Тур успішно заброньовано!</h3>
                                </div>
                                <div class="sb-text">
                                    Бажаємо Вам активного та веселого відпочинку
                                </div>
                            </div>
{*                            <div class="country-photo"><img src="images/collages/{$card->getCountryImage()}"></div>*}
                            <div class="country-photo"><img src="{$card->getCollageImage()}.jpg"></div>
                        </div>
                    </div>

                </div>

            {/foreach}
        </div>
        <div class="arrow-btn" id="next-cards"><img src="images/arrow-next.png"></div>
    </div>
    <div id="carousel-empty">Наразі тури відсутні</div>

{*</div>*}