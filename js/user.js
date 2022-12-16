// registration  section start
$(function(){
    // $('.ordered-tour').click(function(){
    //     //show full card
    //     $('.full_card').addClass('hidden');
    //     let cardID = $(this).attr('full-card-id');
    //     // let contentWidth  = 1000;
    //     // let left = contentWidth / 2;
    //     // let top = $(window).height() / 2;
    //     // $('#' + cardID).css('left', left).css('top', top).removeClass('hidden');
    //     $('#' + cardID).removeClass('hidden');
    //     $('.blackout-bg').show();
    // });


    $('.show-full-tour-info').click(function(){
        //show full card
        // $('.full-tour-info').addClass('hidden');

        $(this).find('.input-arrow').toggleClass('input-dash');

        let span = $(this).find('span');
        // console.log(span);
        let cardID = span.attr('full-card-id');

        // console.log(cardID);

        // $('#' + cardID).removeClass('hidden');
        $('#' + cardID).toggleClass('hidden');
        // $('.blackout-bg').show();
    });


    // $('.blackout-bg').click(function(){
    //     $('.full_card_close_btn').trigger('click');
    //
    // });

    // $('.full_card_close_btn').click(function(){
    //     let cardID = $(this).attr('full-card-id');
    //     $('#' + cardID).addClass('hidden');
    //     $('.blackout-bg').hide();
    // });
    //
    // $('.cancel-tour').click(function (){
    //     if(!confirm("Ви дійсно бажаєте відмінити тур?")) return false;
    //     let tourID = $(this).attr('tour-id');
    //     unBook(tourID, this);
    // });
    //


    $('.cancel-tour').click(function (){
        $('.blackout-bg').show();

        $('.cancel-tour-alert').removeClass('alert-hidden').animate({ top:'50%', opacity: '1'});

        // console.log('this->' + this);
        let delTour = this;
        // console.log(delTour);

        // let tourID = $(this).attr('tour-id');
        let tourID = $(delTour).attr('tour-id');

        console.log(tourID);

        $('#cancel-tour-alert-button-yes').click(function (){
            $('.cancel-tour-alert').addClass('alert-hidden').css('top', 0).css('opacity', 0);
            $('.blackout-bg').hide();
            unBook(tourID, delTour);
        });

        $('#cancel-tour-alert-button-no').click(function (){
            $('.cancel-tour-alert').addClass('alert-hidden').css('top', 0).css('opacity', 0);
            $('.blackout-bg').hide();
            return false;
        });
    });

});



function validateRegForm(){
    // Validate reg form fields
    return true;
}

$('#sign-up').click(function(){
    if(validateRegForm()){
        $('#reg-form').submit();
    }

    return false;
});


function validateSignForm() {
    return true;
}

$('#sign-in').click(function(){
    if(validateSignForm()){
        $('#signin-form').submit();
    }

    return false;
});

$('#logOut').click(function(){
    document.location = 'profile.php?logout=1';
});
// registration  section stop


// Remove user booking
function unBook(tourID, element) {
    $.post("profile.php",
        {
            action: "unbook",
            tourID: tourID
        }
    ).done(function (data) {
        // remove booking
        if(data == 1) $(element).closest('DIV').remove();
        else{
            alert('Сталася помилка!');
        }
    });
}


$('#close-profile-x').click(function(){
    history.back();
});

$('#hide-password').click(function (){
    $('#password-singIn').attr('type', 'text');
    $(this).hide();
    $('#show-password').show();
});

$('#show-password').click(function (){
    $('#password-singIn').attr('type', 'password');
    $(this).hide();
    $('#hide-password').show();
});

$('#change-phone').click(function(){
   $('.user-info-container-phone').addClass('user-info-hidden');
   $('.user-info-container-change-phone').removeClass('user-info-hidden');
});

$('#change-email').click(function(){
    $('.user-info-container-email').addClass('user-info-hidden');
    $('.user-info-container-change-email').removeClass('user-info-hidden');
});

$('.full_card_close_btn').click(function(){
    let cardID = $(this).attr('full-card-id');
    $('#' + cardID).addClass('hidden');
    $('.blackout-bg').hide();
});
