//just for checking
// function cc(msg){
//     console.log(msg);
// }

//smooth scrolling
document.addEventListener("DOMContentLoaded", function(event) {
    $('a[href*="#"]')
        //removing links that don't actually link to anything
        .not('[href="#"]')
        .not('[href="#0"]')
        .click(function(event) {
            //on-page links
            if (location.pathname.replace(/^\//, '') === this.pathname.replace(/^\//, '')
                &&
                location.hostname === this.hostname) {
                //figure out element to scroll to
                let target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                //checking if a scroll target exists
                if (target.length) {
                    //only prevent default if animation is actually gonna happen
                    event.preventDefault();
                    $('html, body').animate({
                        scrollTop: target.offset().top
                    }, 2000, function() {
                        //callback after animation
                        //change focus
                        let $target = $(target);
                        $target.focus();
                        //checking if the target was focused
                        if ($target.is(":focus")) {
                            return false;
                        } else {
                            //adding tabindex for elements not focusable
                            $target.attr('tabindex','-1');
                            //again setting focus
                            $target.focus();
                        }
                    });
                }
            }
        });
});


//header appears on scroll
let header = document.querySelector(".header-menu");
let topHeader = header.offsetTop;
let container = document.querySelector(".container");

window.onscroll = function() {
    if(! /main/.test(pageType) ) return true;

    if (window.pageYOffset > topHeader) {
        header.classList.add("active");
        container.style.padding = "15px 0";
        container.style.transition = "all .1s";
    } else {
        header.classList.remove("active");
        header.style.transition = "all .2s";
        // container.style.padding = "4% 0";
        container.style.padding = "60px 0";
        container.style.transition = "all .2s";
    }
};


// display/hide search
//run search on "Enter", clear search on "Esc"
$('#srch').keyup(function(event) {
    if (event.keyCode === 13) runSearch(); //enter
    if (event.keyCode === 27) $(this).val('');//esc
});

//click on search icon
$('#search-icon').click(function (){
    //if this icon is already clicked -> next click on it will run a search
    if($(this).hasClass('search-icon-clicked')){
        runSearch();
    }
    //hiding menu, showing search
    // $('#menu-line').addClass('hidden');
    $('#menu-line').addClass('hidden');
    $('#menu-line nav').hide('fast');
    //showing title "Menu"
    // $('#menu').removeClass('hidden');
    // $('#srch').removeClass('hidden');

    $('#menu').show('fast');
    $('#srch').show('fast');
    $('#search-icon').removeClass('bi-search').addClass('search-icon-clicked');
});
//click on menu -> showing menu, hiding search
$('.menu-btn').click(function (){
    $('#menu-line').removeClass('hidden');
    $('#srch').hide();
    $('#menu-line nav').show('fast');
    $('#menu').hide('fast');

    // $('#menu-line').removeClass('hidden');
    // $('#menu').addClass('hidden');
    // $('#srch').addClass('hidden');
    $('#search-icon').removeClass('search-icon-clicked').addClass('bi-search');
});


//hide full card
$('.full_card_close_btn').click(function(){
    let cardID = $(this).attr('full-card-id');
    $('#' + cardID).addClass('hidden');
    $('.blackout-bg').hide();
});

//background is getting dark when click on card to see full info
$('.blackout-bg').click(function(){
    $('.full_card_close_btn, .successful-booking-alert, #add-review-success-win-close').trigger('click');
});


//show full card
$('.btn-toOrder').click(function(){
    $('.full_card').addClass('hidden');
    let cardID = $(this).attr('full-card-id');
    // let contentWidth  = 1000;
    // let left = contentWidth / 2 - 443;
    // let top = $(window).height() / 2 - 180;
    // $('#' + cardID).css('left', left).css('top', top).removeClass('hidden');
    $('#' + cardID).removeClass('hidden');
    $('.blackout-bg').show();
});

//switch tours all/hot
$('.switch-button-checkbox').click(function(){
    if($(this).prop('checked') === false) $('.nothot').show();
    else $('.nothot').hide();
    checkShownCardsAmount();
    resetCarouselPosition();
});

//show header menu on page Country
function onCountryPageLoad(){
    $('.banner').css('height', '5vh');
    $('.header-menu').addClass('active');
    $('.container').css('padding', '15px 0');

}

//show country page
function showCountry(countryID){
    document.location="country.php?cid=" + countryID;
}

//run search
function runSearch(){
    document.location = 'country.php?srch=' + $('#srch').val();
}




//card hover
$('.country-card').hover(function (){
        $(this).find('.country-card-info').addClass('hidden');
        $(this).find('.country-card-full-info').removeClass('hidden');
        let countryBGID = "#" + $(this).attr("country-by-id");
        $('body').append("<style id=\"countryBGBlurstyle\">" + countryBGID + "::before{backdrop-filter: blur(5px);}</style>");

        },
    function (){
        $(this).find('.country-card-full-info').addClass('hidden');
        $(this).find('.country-card-info').removeClass('hidden');

        let currentOverride = $('#countryBGBlurstyle');

        if (currentOverride) {
            currentOverride.remove();
        }
    });

//list of countries to search for (main page)
const searchInp = document.querySelector('input.search-input');
const dropList = document.querySelector('ul.search-input');
searchInp.addEventListener('focus', show, false);
searchInp.addEventListener('blur', hide, false);
dropList.addEventListener('click', dropSelect, false);

function hide(){
    setTimeout(() =>
            dropList.classList.remove('visible'),
        300);
}
function show(){
    setTimeout(() =>
            dropList.classList.add('visible'),
        300);
}

function dropSelect(e) {
    searchInp.value = e.target.textContent
    hide();
}

//scrolling to the top of page by clicking this arrow
$('.page-up-arrow').click(function (){
    $("body,html").animate({
        scrollTop:0
    }, 1800);
    return false;
});


function showBookingSuccess(tourID) {
    $('#booking-success-win-'+tourID).show();
}

$('.btn-book-tour').click(function(){
    if(!loggedIn){
        document.location = 'signIn.php';
        return false;
    }

    let tourID = $(this).attr('book-tour-id')

    $.post("profile.php",
        {
            action: "book",
            tourID: tourID
        }
    ).done(function (data) {
        // booking
        if(data == 1) showBookingSuccess(tourID);
        else{
            alert('Вибачте, сталася помилка.');
        }
    });
});


function showAddReviewSuccess() {
    $('.leave-review-success').show();
    $('.blackout-bg').show();
}

$('#btn-review').click(function(){
    if(!loggedIn){
        document.location = 'signIn.php';
        return false;
    }

    $('.leave-review-section').show();
    $('.blackout-bg').show();
});


$('#add-review-success-win-close').click(function() {
    $('.leave-review-success').hide();
    $('.blackout-bg').hide();
});


$('#add-review-win-close').click(function() {
    $('.leave-review-section').hide();
    $('.blackout-bg').hide();
});


$('.booking-alert-close-btn').click(function() {
    $('.successful-booking-alert').hide();
    $('.blackout-bg').hide();
});


$('#btn-review-add').click(function(){
    $.post("profile.php",
        {
            action: "reviewAdd",
            desc: $('#user-review').val(),
            score: $('#user-score').val()
        }
    ).done(function (data) {
        // booking
        if(data == 1) showAddReviewSuccess();
        else{
            alert('Вибачте, сталася помилка.');
        }
    });
});




