/*
 * Template Name: Unify - Responsive Bootstrap Template
 * Description: Business, Corporate, Portfolio and Blog Theme.
 * Version: 1.4
 * Author: @htmlstream
 * Website: http://htmlstream.com
*/

var App = function () {

    function handleIEFixes() {
        //fix html5 placeholder attribute for ie7 & ie8
        if ($.browser.msie && $.browser.version.substr(0, 1) < 9) { // ie7&ie8
            $('input[placeholder], textarea[placeholder]').each(function () {
                var input = $(this);

                $(input).val(input.attr('placeholder'));

                $(input).focus(function () {
                    if (input.val() == input.attr('placeholder')) {
                        input.val('');
                    }
                });

                $(input).blur(function () {
                    if (input.val() == '' || input.val() == input.attr('placeholder')) {
                        input.val(input.attr('placeholder'));
                    }
                });
            });
        }
    }

    function handleBootstrap() {
        /*Bootstrap Carousel*/
        $('.carousel').carousel({
            interval: 15000,
            pause: 'hover'
        });

        /*Tooltips*/
        $('.tooltips').tooltip();
        $('.tooltips-show').tooltip('show');      
        $('.tooltips-hide').tooltip('hide');       
        $('.tooltips-toggle').tooltip('toggle');       
        $('.tooltips-destroy').tooltip('destroy');       

        /*Popovers*/
        $('.popovers').popover();
        $('.popovers-show').popover('show');
        $('.popovers-hide').popover('hide');
        $('.popovers-toggle').popover('toggle');
        $('.popovers-destroy').popover('destroy');
    }

    function handleSearch() {    
        $('.search').click(function () {
            if($('.search-btn').hasClass('fa-search')){
                $('.search-open').fadeIn(500);
                $('.search-btn').removeClass('fa-search');
                $('.search-btn').addClass('fa-times');
            } else {
                $('.search-open').fadeOut(500);
                $('.search-btn').addClass('fa-search');
                $('.search-btn').removeClass('fa-times');
            }   
        }); 
    }

    function handleToggle() {
        $('.list-toggle').on('click', function() {
            $(this).toggleClass('active');
        });

        /*
        $('#serviceList').on('shown.bs.collapse'), function() {
            $(".servicedrop").addClass('glyphicon-chevron-up').removeClass('glyphicon-chevron-down');
        }

        $('#serviceList').on('hidden.bs.collapse'), function() {
            $(".servicedrop").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
        }
        */
    }

    function handleSwitcher() {    
        var panel = $('.style-switcher');

        $('.style-switcher-btn').click(function () {
            $('.style-switcher').show();
        });

        $('.theme-close').click(function () {
            $('.style-switcher').hide();
        });
        
        $('li', panel).click(function () {
            var color = $(this).attr("data-style");
            var data_header = $(this).attr("data-header");
            setColor(color, data_header);
            $('.list-unstyled li', panel).removeClass("theme-active");
            $(this).addClass("theme-active");
        });

        var setColor = function (color, data_header) {
            $('#style_color').attr("href", "assets/css/themes/" + color + ".css");
            if(data_header == 'light'){
                $('#style_color-header-1').attr("href", "assets/css/themes/headers/header1-" + color + ".css");
                $('#logo-header').attr("src", "assets/img/logo1-" + color + ".png");
                $('#logo-footer').attr("src", "assets/img/logo2-" + color + ".png");
            } else if(data_header == 'dark'){
                $('#style_color-header-2').attr("href", "assets/css/themes/headers/header2-" + color + ".css");
                $('#logo-header').attr("src", "assets/img/logo1-" + color + ".png");
                $('#logo-footer').attr("src", "assets/img/logo2-" + color + ".png");
            }
        }
    }

    function handleBoxed() {
        $('.boxed-layout-btn').click(function(){
            $(this).addClass("active-switcher-btn");
            $(".wide-layout-btn").removeClass("active-switcher-btn");
            $("body").addClass("boxed-layout container");
        });
        $('.wide-layout-btn').click(function(){
            $(this).addClass("active-switcher-btn");
            $(".boxed-layout-btn").removeClass("active-switcher-btn");
            $("body").removeClass("boxed-layout container");
        });
    }

    function handleHeader() {
         $(window).scroll(function() {
            if ($(window).scrollTop()>100){
                $(".header-fixed .header").addClass("header-fixed-shrink");
            }
            else {
                $(".header-fixed .header").removeClass("header-fixed-shrink");
            }
        });
    }

    return {
        init: function () {
            // handleBootstrap();
            // handleIEFixes();
            handleSearch();
            handleToggle();
            handleSwitcher();
            handleBoxed();
            handleHeader();
        },

        initSliders: function () {
            $('#clients-flexslider').flexslider({
                animation: "slide",
                easing: "swing",
                animationLoop: true,
                itemWidth: 1,
                itemMargin: 1,
                minItems: 2,
                maxItems: 9,
                controlNav: false,
                directionNav: false,
                move: 2
            });
            
            $('#clients-flexslider1').flexslider({
                animation: "slide",
                easing: "swing",
                animationLoop: true,
                itemWidth: 1,
                itemMargin: 1,
                minItems: 2,
                maxItems: 5,
                controlNav: false,
                directionNav: false,
                move: 2
            });
            
            $('#photo-flexslider').flexslider({
                animation: "slide",
                controlNav: false,
                animationLoop: false,
                itemWidth: 80,
                itemMargin: 0
            }); 
            
            $('#testimonal_carousel').collapse({
                toggle: false
            });
        },

        initFancybox: function () {
            $(".fancybox-button").fancybox({
            groupAttr: 'data-rel',
            prevEffect: 'none',
            nextEffect: 'none',
            closeBtn: true,
            helpers: {
                title: {
                    type: 'inside'
                    }
                }
            });

            $(".iframe").fancybox({
                maxWidth    : 800,
                maxHeight   : 600,
                fitToView   : false,
                width       : '70%',
                height      : '70%',
                autoSize    : false,
                closeClick  : false,
                openEffect  : 'none',
                closeEffect : 'none'
            });            
        },

        initBxSlider: function () {
            $('.bxslider').bxSlider({
                maxSlides: 4,
                minSlides: 4,
                slideWidth: 360,
                slideMargin: 10,
            });            

            $('.bxslider1').bxSlider({
                minSlides: 3,
                maxSlides: 3,
                slideWidth: 360,
                slideMargin: 10
            });            

            $('.bxslider2').bxSlider({
                minSlides: 2,
                maxSlides: 2,
                slideWidth: 360,
                slideMargin: 10
            });            
        },

        initCounter: function () {
            $('.counter').counterUp({
                delay: 10,
                time: 1000
            });
        },

        initParallaxBg: function () {
            $('.parallaxBg').parallax("50%", 0.2);
            $('.parallaxBg1').parallax("50%", 0.4);
        },

    };

}();