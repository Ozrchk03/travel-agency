{include file="header-country.tpl"}

<div class="content-align">
    <div id="tours" class="popular-tours">
        <div class="header">Тури</div>
        {include file="card.tpl"}
    </div>
        <div id="photos">
{*            <img src="{$collage_image}" class="collage-img" data-aos="zoom-out-down" data-aos-once="true"    >*}
            <div class="country-photo-container"  data-aos="fade-down" data-aos-once="true">
                <div class="country-photo-div">
                    <img id="country-photo-1" src="{$collage_image}-01.jpg">
                </div>
                <div class="country-photo-div">
                    <img id="country-photo-2" src="{$collage_image}-02.jpg">
                </div>
                <div class="country-photo-div">
                    <img id="country-photo-3" src="{$collage_image}-03.jpg">
                </div>
                <div class="country-photo-div">
                    <img id="country-photo-4" src="{$collage_image}-04.jpg">
                </div>
                <div class="country-photo-div">
                    <img id="country-photo-5" src="{$collage_image}-05.jpg">
                </div>
                <div class="country-photo-div">
                    <img id="country-photo-6" src="{$collage_image}-06.jpg">
                </div>
                <div class="country-photo-div">
                    <img id="country-photo-7" src="{$collage_image}-07.jpg">
                </div>
            </div>
        </div>
</div>
<script src="js/cards.js"></script>
{include file="footer.tpl"}