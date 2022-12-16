{include file="header.tpl"}

<div class="content-align">
    <div id="popularTours" class="popular-tours">
        <div class="countries-arrow-container" data-aos="fade-right">
            <span class="countries-path"><h4><a href="index.php">Головна сторінка</a></h4></span>
            <span><img src="images/countries-arrow.png"></span>
            <span class="countries-path">Країни</span>
        </div>
        <div class="header header-country">Країни</div>
        <div class="country-cards">
            {foreach $countries as $country}
                <div class="country-card" country-by-id="country-card-bg-{$country->getID()}" >
                    <div class="country-card-bg" id="country-card-bg-{$country->getID()}" style="background: url('images/countries/{$country->getMainImage()}');background-size: cover"></div>
                    <div class="country-card-info ">
                        <div>
                            {$country->getName()}
                        </div>
                    </div>
                    <div class="country-card-full-info hidden ">
                        <div class="country-card-title">
                            {$country->getName()}
                        </div>
                        <div class="country-card-description">
                            {$country->getDescription()}
                        </div>
                        <button class="country-card-btn" onclick="showCountry({$country->getID()})">Переглянути</button>
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
</div>


<script>
    $(function(){
        onCountryPageLoad();
    });
</script>

{include file="footer.tpl"}