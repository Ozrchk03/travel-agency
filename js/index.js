//carousel reviews
let carousel1 = document.querySelector('#reviews');
let widthReview= 490; // card's width
let countReview = 2; // cards shown
let reviews = carousel1.querySelector('.blocks');
let review  = carousel1.querySelectorAll('.review-block');
let position1 = 0;


$(document).ready(function () {
    //about company section, increasing numbers
    let show = true;
    let countbox = ".img-aboutComp";
    $(window).on("scroll load resize", function () {
        //canceling animation if it already was
        if (!show) return false;
        //counting amount of pixels by which page has been scrolled
        let w_top = $(window).scrollTop();
        //distance from the block with counters to the top of the entire document
        let e_top = $(countbox).offset().top;
        let w_height = $(window).height();
        let d_height = $(document).height();
        //full height of the block with counters
        let e_height = $(countbox).outerHeight();
        if (w_top + 800 >= e_top || w_height + w_top == d_height || e_height + e_top < w_height) {
            $('.number-ac').css('opacity', '1').spincrement({
                thousandSeparator: "",
                duration: 2500
            });
            show = false;
        }
    });

    //carousel reviews
    carousel1.querySelector('#prev-reviews').onclick = function() {
        // to the left
        position1 += widthReview ;
        // last move
        position1 = Math.min(position1, 0)
        reviews.style.marginLeft = position1 + 'px';
    };

    carousel1.querySelector('#next-reviews').onclick = function() {
        // to the right
        position1 -= widthReview ;
        position1 = Math.max(position1, -widthReview * (review.length - countReview))

        reviews.style.marginLeft = position1 + 'px';
    };

});

// AOS.init();
