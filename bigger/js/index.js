/**
 * Created by Saber on 2015/3/29.
 */
$(function () {
    $("#play").hover(function () {
        $(this).addClass("hover-swing");
        $("#go").addClass("hover-tada-infinite-1");
        $("#just").addClass("hover-tada-infinite-2");
    }, function () {
        $(this).removeClass("hover-swing slide-2-3");
        $("#go").removeClass("hover-tada-infinite-1 slide-2-1");
        $("#just").removeClass("hover-tada-infinite-2 slide-2-2");
    });

    $("#circle-1").hover(function () {
        $("#circle-1").addClass("hover-rubberBand");
        $("#right-p1,#shadow-2").addClass("hover-pulse");
        $("#iphone").addClass("hover-flipInY");
        $("#xxxx").addClass("hover-flipInY-2");
        $("#avatar").addClass("hover-flipInY-3");
        $("#square-1").addClass("hover-flipInY-4");
        $("#square-2").addClass("hover-flipInY-5");
        $("#iphone-content-p1").css({"display": "block"}).addClass("hover-flipInX-6");
        $("#iphone-content-img1").css({"display": "block"}).addClass("hover-flipInY-7");
        $("#iphone-content-p2,#iphone-content-img2,#iphone-content-p3,#iphone-content-img3").css({"display": "none"});

    }, function () {
        $("#circle-1").removeClass("hover-rubberBand slide-2-5");
        $("#right-p1,#shadow-2").removeClass("hover-pulse slide-2-4 slide-2-8");
        $("#iphone").removeClass("hover-flipInY slide-2-11");
        $("#xxxx").removeClass("hover-flipInY-2 iphone-content-1");
        $("#avatar").removeClass("hover-flipInY-3 iphone-content-2");
        $("#square-1").removeClass("hover-flipInY-4 iphone-content-3");
        $("#square-2").removeClass("hover-flipInY-5 iphone-content-4");
        $("#iphone-content-p1").removeClass("hover-flipInX-6 iphone-content-5");
        $("#iphone-content-img1").removeClass("hover-flipInY-7 iphone-content-6");
    });

    $("#circle-2").hover(function () {
        $("#circle-2").addClass("hover-rubberBand");
        $("#right-p2,#shadow-2").addClass("hover-pulse");
        $("#iphone").addClass("hover-flipInY");
        $("#xxxx").addClass("hover-flipInY-2");
        $("#avatar").addClass("hover-flipInY-3");
        $("#square-1").addClass("hover-flipInY-4");
        $("#square-2").addClass("hover-flipInY-5");
        $("#iphone-content-p1,#iphone-content-img1,#iphone-content-p3,#iphone-content-img3").css({"display": "none"});
        $("#iphone-content-p2").css({"display": "block"}).addClass("hover-flipInX-6");
        $("#iphone-content-img2").css({"display": "block"}).addClass("hover-flipInY-7");
    }, function () {
        $("#circle-2").removeClass("hover-rubberBand slide-2-6");
        $("#right-p2,#shadow-2").removeClass("hover-pulse slide-2-4 slide-2-9");
        $("#xxxx").removeClass("hover-flipInY-2 iphone-content-1");
        $("#iphone").removeClass("hover-flipInY slide-2-11");
        $("#avatar").removeClass("hover-flipInY-3 iphone-content-2");
        $("#square-1").removeClass("hover-flipInY-4 iphone-content-3");
        $("#square-2").removeClass("hover-flipInY-5 iphone-content-4");
        $("#iphone-content-p2").removeClass("hover-flipInX-6 iphone-content-5");
        $("#iphone-content-img2").removeClass("hover-flipInY-7 iphone-content-6");
    });

    $("#circle-3").hover(function () {
        $("#circle-3").addClass("hover-rubberBand");
        $("#right-p3,#shadow-2").addClass("hover-pulse");
        $("#iphone").addClass("hover-flipInY");
        $("#xxxx").addClass("hover-flipInY-2");
        $("#avatar").addClass("hover-flipInY-3");
        $("#square-1").addClass("hover-flipInY-4");
        $("#square-2").addClass("hover-flipInY-5");
        $("#iphone-content-p1,#iphone-content-img1,#iphone-content-p2,#iphone-content-img2").css({"display": "none"});
        $("#iphone-content-p3").css({"display": "block"}).addClass("hover-flipInX-6");
        $("#iphone-content-img3").css({"display": "block"}).addClass("hover-flipInY-7");
    }, function () {
        $("#circle-3").removeClass("hover-rubberBand slide-2-7");
        $("#right-p3,#shadow-2").removeClass("hover-pulse slide-2-4 slide-2-10");
        $("#iphone").removeClass("hover-flipInY slide-2-11");
        $("#xxxx").removeClass("hover-flipInY-2 iphone-content-1");
        $("#avatar").removeClass("hover-flipInY-3 iphone-content-2");
        $("#square-1").removeClass("hover-flipInY-4 iphone-content-3");
        $("#square-2").removeClass("hover-flipInY-5 iphone-content-4");
        $("#iphone-content-p3").removeClass("hover-flipInX-6 iphone-content-5");
        $("#iphone-content-img3").removeClass("hover-flipInY-7 iphone-content-6");
    });

    $(".next-btn").hover(function () {
        $(this).addClass("hover-bounce");
    }, function () {
        $(this).removeClass("hover-bounce");
    });
});
