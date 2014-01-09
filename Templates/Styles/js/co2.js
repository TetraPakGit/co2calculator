$(document).ready(function () {
    slideCurtain();
    infoFlyout();
    tabClick();
    carouselChildren();
    startPage();
    checkIe8Comp();
});

$(window).load(function () {
    imagePageSlider();
});

function checkIe8Comp() {
    var ua = navigator.userAgent;
    if (ua.indexOf("Trident/4.0") > -1) {
        if (ua.indexOf("MSIE 7.0") > -1) {
            $('body').addClass('ie8Comp');
        }
    }
}
function imagePageSlider() {
    $('#carousel').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        itemWidth: 150,
        itemMargin: 5,
        asNavFor: '#slider'
    });
    $('#slider').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        sync: "#carousel"
    });
}

function infoFlyout() {
    $('#content #page-header .info-icon').click(function () {
        $("#content #page-header .info-flyout").fadeToggle();
    });
}

function slideCurtain() {
    if (!$('.columns').hasClass('hasColumns')) {
        $('.columns').columnize({ columns: 2 });
        $('.columns').addClass('hasColumns');
    }
    /*hasQuery = window.location.href.indexOf("?");
    if ($.cookie("curtain") || hasQuery > -1) {
        $('#curtain .curtain-text, #curtain .close-curtain, #curtain-arrow').toggle();
    }*/
    $('#curtain .curtain-text, #curtain .close-curtain, #curtain-arrow').toggle();
    $('#curtain .curtain-header, #curtain-arrow').click(function () {
        if (!$('#curtain .curtain-header h2').hasClass('no-click')) {
            $('#curtain .curtain-text').slideToggle(function () {
                $('#curtain .close-curtain').fadeToggle(function () {
                    if ($('#curtain .close-curtain').css('display') == 'block') {
                        $('#curtain .open-curtain').css('display', 'none');
                    }
                });
                $('#curtain .open-curtain').fadeToggle();
                $('#curtain-arrow').toggle();
                /*$.cookie("curtain", "1", { expires: 365 });*/
            });
            return false;
        }
    });
}

function tabClick() {
    $('.nav.nav-tabs a').click(function () {
        $('.nav.nav-tabs li').removeClass('active');
        $(this).parent().addClass('active');
        $('.nav-tabs-content').css('display', 'none');
        $($(this).attr('href')).css('display', 'block');
        return false;
    });
}

function carouselChildren() {
    if ($("#carousel li").length <= 1) {
        $("#carousel").css('display','none');
    }
}

function startPage() {
    if ($('#curtain .curtain-header h2').hasClass('no-click')) {
        $('body').addClass('startpage');
    }
}