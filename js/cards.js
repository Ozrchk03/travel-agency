//carousel cards
let carousel = document.querySelector('#carousel-card');
let width= 336; // card's width
let count = 3; // cards shown
let cards = carousel.querySelector('.cards');
let card = carousel.querySelectorAll('.card');
let position = 0;


$(function(){
    carousel.querySelector('#prev-cards').onclick = function() {
        // to the left
        position += width ;
        // last move
        position = Math.min(position, 0)
        cards.style.marginLeft = position + 'px';
    };

    carousel.querySelector('#next-cards').onclick = function() {
        // to the right
        position -= width ;
        position = Math.max(position, -width * (card.length - count));
        cards.style.marginLeft = position + 'px';
    };


    // init filter calendar
    $('#input-date').daterangepicker({
        "autoApply": true,
        // "startDate": "06/08/2022",
        // "endDate": "06/14/2022",
        "opens": "center",
        "drops": "auto"
    }, function(start, end, label) {
        // console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
        filterCardsByDate(start.format('YYYYMMDD'), end.format('YYYYMMDD'));
    });

    checkCardsNumber();
    checkShownCardsAmount();

    //price filter current price while moving mouse
    let currentPriceDiv = $('#current-price');
    let setCurrentPriceTimeout = null;
    $('#slider').on('input change', function(){
        let currentPrice = $(this).val();
        $(currentPriceDiv).text("$" + currentPrice);
        clearTimeout(setCurrentPriceTimeout);
        setCurrentPriceTimeout = setTimeout(function(){
            filterCardsByPrice(currentPrice);
        }, 300);
        // cc('set to:' + $(this).val());
    });
});

//changing arrow to dash on click
$('.input-title').click(function (){
    $(this).find('.input-arrow').toggleClass('input-dash');
});

//type list
$('#input-type').click(function (){
    $('.input-type-list').toggle();
});

//price container
$('#input-price').click(function (){
    $('.slider-container').toggle();
});

//clean filter
$('#input-clear-filter').click(function (){
    $('.card').removeClass('hidden-date hidden-type hidden-price');
    $('#carousel-card').show();
    $('#carousel-empty').hide();
    resetCarouselPosition();
});

//filtering cards by date
function filterCardsByDate(from, to){
    $('.card').removeClass('hidden-date').each(function(){
        let cardDate = $(this).find('.card-date').val();
        if(cardDate < from || cardDate > to){
            $(this).addClass('hidden-date');
        }
    });
    $('#input-date').find('.input-arrow').toggleClass('input-dash');
    resetCarouselPosition();
}

//filtering cards by price
function filterCardsByPrice(price){
    $('.card').removeClass('hidden-price').each(function(){
        let cardPrice = parseInt($(this).find('.card-price').val());
        if(cardPrice > price){
            $(this).addClass('hidden-price');
        }
    });
    resetCarouselPosition();
}

//filtering cards by type
function filterCardsByType(userType){
    $('.card').removeClass('hidden-type').each(function(){
        let cardType = $(this).find('.card-type').val();
        if(cardType !== userType){
            $(this).addClass('hidden-type');
        }
    });
    $('#input-type').find('.input-arrow').toggleClass('input-dash');
    resetCarouselPosition();
}

//click on type list element -> filtering
$('.input-type-list li').click(function(){
    let userType = $(this).text();
    filterCardsByType(userType);
    $('.input-type-list').hide();
});

//setting card's position to 0 while sorting
function resetCarouselPosition(){
    checkCardsNumber();
    checkShownCardsAmount();
    cards.style.marginLeft = '0px';
}

//checking amount of cards, if 0 -> showing a message
function checkCardsNumber(){
    $('#carousel-card').show();
    $('#carousel-empty').hide();
    if(! $('.card:visible').length){
        // $('#carousel-card').hide();
        $('#carousel-empty').show();
    }
    else{
        // $('#carousel-card').show();
        $('#carousel-empty').hide();
    }
}

//if there're 3 or less cards, hide arrows from carousel
function checkShownCardsAmount(){
    if($('.card:visible').length <= 3){
        $('#prev-cards').hide();
        $('#next-cards').hide();
    }else{
        $('#prev-cards').show();
        $('#next-cards').show();
    }
}


    // AOS.init();




