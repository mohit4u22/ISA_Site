﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>The Parallel Website Template | Home :: w3layouts</title>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900' rel='stylesheet' type='text/css'>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="css/magnific-popup1.css">

    <link rel="stylesheet" type="text/css" href="css/prettyPhoto.css">
    <!--  jquery plguin -->
    <script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>

    <!--start slider --  ---->
    <link rel="stylesheet" href="css/fwslider.css" media="all">

    <script src="js/css3-mediaqueries.js"></script>
    <script src="js/fwslider.js"></script>
    <!--end slider -->

    <script type="text/javascript">
        $(document).ready(function () {

            var defaults = {
                containerID: 'toTop', // fading element id
                containerHoverID: 'toTopHover', // fading element hover id
                scrollSpeed: 1200,
                easingType: 'linear'
            };


            $().UItoTop({ easingType: 'easeOutQuart' });

        });
    </script>
    <!-- Add fancyBox light-box -->
    <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $('.popup-with-zoom-anim').magnificPopup({
                type: 'inline',
                fixedContentPos: false,
                fixedBgPos: true,
                overflowY: 'auto',
                closeBtnInside: true,
                preloader: false,
                midClick: true,
                removalDelay: 300,
                mainClass: 'my-mfp-zoom-in'
            });
        });
    </script>

    <!-- //End fancyBox light-box -->
</head>
<body>
    <!-- start header -->
    <div class="header_bg">
        <div class="wrap">
            <div class="header">
                <div class="logo">
                    <h1><a href="default.aspx">
                        <img src="images/logo.png" alt="" /></a></h1>

                </div>
                <div class="h_right">
                    <ul class="menu">
                        <li class="active"><a href="#home">Home</a></li>
                        <li><a href="#services" class="scroll">Services</a></li>
                        <li><a href="#portfolio" class="scroll">Portfolio</a></li>
                        <li><a href="#pricing" class="scroll">Pricing</a></li>
                        <li>
                            <a class="popup-with-zoom-anim" href="#small-dialog-login"><i>Login</i></a>
                        </li>
                        <li>
                            <a class="popup-with-zoom-anim" href="#small-dialog-register"><i>Register</i></a>
                        </li>
                        <li><a href="#about" class="scroll">About</a></li>
                        <li class="last"><a href="#contact" class="scroll">Contact</a></li>
                    </ul>
                    <div id="sb-search" class="sb-search">
                        <form>
                            <input class="sb-search-input" placeholder="Enter your search term..." type="text" value="" name="search" id="search">
                            <input class="sb-search-submit" type="submit" value="">
                            <span class="sb-icon-search"></span>
                        </form>
                    </div>
                    <script src="js/classie.js"></script>
                    <script src="js/uisearch.js"></script>
                    <script>
                        new UISearch(document.getElementById('sb-search'));
                    </script>
                    <!-- start smart_nav * -->
                    <nav class="nav">
                        <ul class="nav-list">
                            <li class="nav-item"><a href="#home">Home</a></li>
                            <li class="nav-item"><a href="#services" class="scroll">Services</a></li>
                            <li class="nav-item"><a href="#portfolio" class="scroll">Portfolio</a></li>
                            <li class="nav-item"><a href="#pricing" class="scroll">Pricing</a></li>
                            <li class="nav-item"><a href="#about" class="scroll">About</a></li>
                            <li class="nav-item"><a href="#contact" class="scroll">Contact</a></li>
                            <div class="clear"></div>
                        </ul>
                    </nav>
                    <script type="text/javascript" src="js/responsive.menu.js"></script>
                    <!-- end smart_nav * -->
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>

    <!----start-images-slider---->
    <div class="images-slider">
        <!-- start slider -->
        <div id="fwslider">
            <div class="slider_container">
                <div class="slide">
                    <!-- Slide image -->
                    <img src="images/slider-bg.jpg" alt="" />
                    <!-- /Slide image -->
                    <!-- Texts container -->
                    <div class="slide_content">
                        <div class="slide_content_wrap">
                            <!-- Text title -->
                            <h4 class="title">Welcome To Indian Student Association</h4>
                            <!-- /Text title -->
                            <!-- Text description -->
                            <p class="description">Be a part of this Organization!</p>
                            <!-- /Text description -->
                            <div class="slide-btns description">
                            </div>
                        </div>
                    </div>
                    <!-- /Texts container -->
                </div>
                <!-- /Duplicate to create more slides -->
                <div class="slide">
                    <img src="images/slider-bg.jpg" alt="" />
                    <div class="slide_content">
                        <div class="slide_content_wrap">
                            <!-- Text title -->
                            <h4 class="title">Be proud of being an Indian</h4>
                            <!-- /Text title -->
                            <!-- Text description -->
                            <p class="description">Help us create more members!</p>
                            <!-- /Text description -->
                            <div class="slide-btns description">
                            </div>
                        </div>
                    </div>
                </div>
                <!--/slide -->
            </div>
            <div class="timers"></div>
            <div class="slidePrev"><span></span></div>
            <div class="slideNext"><span></span></div>
        </div>
        <!--/slider -->
    </div>
    <!-----------service------------>
    <div class="sevice" id="services">
        <div class="wrap">
            <div class="service-grids">
                <h2>our Services</h2>
                <div class="images_1_of_4">
                    <img src="images/cal.png">
                    <h3><a href="#">WebDesign</a></h3>
                    <p>Lorem ipsum is simply dummy text of the printing and typesetting industry.Lorem ipsum has been </p>
                </div>
                <div class="images_1_of_4">
                    <img src="images/port.png">
                    <h3><a href="#">UIDesign</a></h3>
                    <p>Lorem ipsum is simply dummy text of the printing and typesetting industry.Lorem ipsum has been</p>
                </div>
                <div class="images_1_of_4">
                    <img src="images/recyle.png">
                    <h3><a href="#">Prototype</a></h3>
                    <p>Lorem ipsum is simply dummy text of the printing and typesetting industry.Lorem ipsum has been </p>
                </div>
                <div class="images_1_of_4">
                    <img src="images/camera.png">
                    <h3><a href="#">Photography</a></h3>
                    <p>Lorem ipsum is simply dummy text of the printing and typesetting industry.Lorem ipsum has been</p>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <!-----------//service//------------>
    <!----------- message ------------>
    <div class="message">
        <div class="wrap">
            <h3>Do You Like This Clean Theme?</h3>
            <div class="buttons">
                <div class="span1">
                    <a href="#">
                        <i>Purchase</i>
                        <div class="clear"></div>
                    </a>
                </div>
                <div class="span2">
                    <a href="#">
                        <i>Follow</i>
                        <div class="clear"></div>
                    </a>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>

    <div id="cbp-so-scroller" class="cbp-so-scroller">
        <!--Portfolio-->
        <div id="portfolio" class="clearfix">
            <div class="portfolio-bg"></div>
            <div class="typo1">
                <div class="wrapper clearfix">
                    <div class="section-title">
                        <h3 class="heading">Portfolio</h3>
                        <h6></h6>
                    </div>
                    <!--end:section-title-->

                    <div id="options" class="clearfix">
                        <ul id="filters" class="option-set clearfix" data-option-key="filter">
                            <li><a href="#filter" data-option-value=".web-design">Web-design</a></li>
                            <li><a href="#filter" data-option-value=".photo">UI Design</a></li>
                            <li><a href="#filter" data-option-value=".ios-app">Prototype</a></li>
                            <li><a href="#filter" data-option-value=".graphic">Photography</a></li>
                        </ul>
                        <!--end:filters-->
                    </div>

                </div>
                <!--end:wrapper-->

                <ul id="container" class="clickable cs-style-5 grid clearfix isotope" style="position: relative; overflow: hidden; height: 534px; width: 1475px;">

                    <li class="element photo isotope-item" style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(0px, 0px, 0px);">
                        <figure>
                            <img src="images/pf-1.jpg" alt="">
                            <figcaption>
                                <h3><a href="#">This is project name</a></h3>
                                <div class="meta-box clearfix">
                                    <span class="entry-categories"><a href="#">print art</a></span>
                                    &nbsp;/&nbsp;
                                    <span class="entry-categories"><a href="#">photo</a></span>
                                </div>
                                <footer>
                                    <div id="nivo-lightbox-demo">
                                        <p><a href="images/pf-1.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">View</a> </p>
                                    </div>
                                </footer>
                            </figcaption>
                        </figure>

                    </li>

                    <li class="element web-design isotope-item" style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(295px, 0px, 0px);">
                        <figure>
                            <img src="images/pf-2.jpg" alt="">
                            <figcaption>
                                <h3><a href="#">This is project name</a></h3>
                                <div class="meta-box clearfix">
                                    <span class="entry-categories"><a href="#">print art</a></span>
                                    &nbsp;/&nbsp;
                                    <span class="entry-categories"><a href="#">photo</a></span>
                                </div>
                                <footer>
                                    <div id="nivo-lightbox-demo">
                                        <p><a href="images/pf-2.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">View</a> </p>
                                    </div>
                                </footer>
                            </figcaption>
                        </figure>

                    </li>

                    <li class="element ios-app isotope-item" style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(590px, 0px, 0px);">
                        <figure>
                            <img src="images/pf-3.jpg" alt="">
                            <figcaption>
                                <h3><a href="#">This is project name</a></h3>
                                <div class="meta-box clearfix">
                                    <span class="entry-categories"><a href="#">print art</a></span>
                                    &nbsp;/&nbsp;
                                    <span class="entry-categories"><a href="#">photo</a></span>
                                </div>
                                <footer>
                                    <div id="nivo-lightbox-demo">
                                        <p><a href="images/pf-3.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">View</a> </p>
                                    </div>
                                </footer>
                            </figcaption>
                        </figure>

                    </li>

                    <li class="element graphic isotope-item" style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(885px, 0px, 0px);">
                        <figure>
                            <img src="images/pf-4.jpg" alt="">
                            <figcaption>
                                <h3><a href="#">This is project name</a></h3>
                                <div class="meta-box clearfix">
                                    <span class="entry-categories"><a href="#">print art</a></span>
                                    &nbsp;/&nbsp;
                                    <span class="entry-categories"><a href="#">photo</a></span>
                                </div>
                                <footer>
                                    <div id="nivo-lightbox-demo">
                                        <p><a href="images/pf-4.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">View</a> </p>
                                    </div>
                                </footer>
                            </figcaption>
                        </figure>

                    </li>

                    <li class="element photo isotope-item" style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(1180px, 0px, 0px);">
                        <figure>
                            <img src="images/pf-5.jpg" alt="">
                            <figcaption>
                                <h3><a href="#">This is project name</a></h3>
                                <div class="meta-box clearfix">
                                    <span class="entry-categories"><a href="#">print art</a></span>
                                    &nbsp;/&nbsp;
                                    <span class="entry-categories"><a href="#">photo</a></span>
                                </div>
                                <footer>
                                    <div id="nivo-lightbox-demo">
                                        <p><a href="images/pf-5.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">View</a> </p>
                                    </div>
                                </footer>
                            </figcaption>
                        </figure>

                    </li>

                    <li class="element web-design isotope-item" style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(0px, 267px, 0px);">
                        <figure>
                            <img src="images/pf-6.jpg" alt="">
                            <figcaption>
                                <h3><a href="#">This is project name</a></h3>
                                <div class="meta-box clearfix">
                                    <span class="entry-categories"><a href="#">print art</a></span>
                                    &nbsp;/&nbsp;
                                    <span class="entry-categories"><a href="#">photo</a></span>
                                </div>
                                <footer>
                                    <div id="nivo-lightbox-demo">
                                        <p><a href="images/pf-6.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">View</a> </p>
                                    </div>
                                </footer>
                            </figcaption>
                        </figure>

                    </li>

                    <li class="element ios-app isotope-item" style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(295px, 267px, 0px);">
                        <figure>
                            <img src="images/pf-7.jpg" alt="">
                            <figcaption>
                                <h3><a href="#">This is project name</a></h3>
                                <div class="meta-box clearfix">
                                    <span class="entry-categories"><a href="#">print art</a></span>
                                    &nbsp;/&nbsp;
                                    <span class="entry-categories"><a href="#">photo</a></span>
                                </div>
                                <footer>
                                    <div id="nivo-lightbox-demo">
                                        <p><a href="images/pf-7.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">View</a> </p>
                                    </div>
                                </footer>

                            </figcaption>
                        </figure>

                    </li>

                    <li class="element graphic isotope-item" style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(590px, 267px, 0px);">
                        <figure>
                            <img src="images/pf-8.jpg" alt="">
                            <figcaption>
                                <h3><a href="#">This is project name</a></h3>
                                <div class="meta-box clearfix">
                                    <span class="entry-categories"><a href="#">print art</a></span>
                                    &nbsp;/&nbsp;
                                    <span class="entry-categories"><a href="#">photo</a></span>
                                </div>
                                <footer>
                                    <div id="nivo-lightbox-demo">
                                        <p><a href="images/pf-8.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">View</a> </p>
                                    </div>
                                </footer>
                            </figcaption>
                        </figure>
                    </li>

                    <li class="element photo isotope-item" style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(885px, 267px, 0px);">
                        <figure>
                            <img src="images/pf-9.jpg" alt="">
                            <figcaption>
                                <h3><a href="#">This is project name</a></h3>
                                <div class="meta-box clearfix">
                                    <span class="entry-categories"><a href="#">print art</a></span>
                                    &nbsp;/&nbsp;
                                    <span class="entry-categories"><a href="#">photo</a></span>
                                </div>
                                <footer>
                                    <div id="nivo-lightbox-demo">
                                        <p><a href="images/pf-9.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">View</a> </p>
                                    </div>
                                </footer>
                            </figcaption>
                        </figure>

                    </li>

                    <li class="element web-design isotope-item" style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(1180px, 267px, 0px);">
                        <figure>
                            <img src="images/pf-10.jpg" alt="">
                            <figcaption>
                                <h3><a href="#">This is project name</a></h3>
                                <div class="meta-box clearfix">
                                    <span class="entry-categories"><a href="#">print art</a></span>
                                    &nbsp;/&nbsp;
                                    <span class="entry-categories"><a href="#">photo</a></span>
                                </div>
                                <footer>
                                    <div id="nivo-lightbox-demo">
                                        <p><a href="images/pf-10.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">View</a> </p>
                                    </div>
                            </figcaption>
                        </figure>
                    </li>
                    <div class="clear"></div>
                </ul>
                <!-- #container -->

            </div>
            <!--end:typo1-->
        </div>
    </div>
    <!-- portfolio_script_javascript-->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/custom.js"></script>
    <script src="js/modernizr.custom.js"></script>
    <!----------- message1 ------------>
    <div class="message1">
        <div class="wrap">
            <h3>Pricing Table</h3>
            <p>Clean beautiful flat Table</p>
        </div>
    </div>
    <!-----------start-pricing----------->
    <div class="pricing-plans" id="pricing">
        <div class="wrap">
            <h3>Our Price</h3>
            <div class="pricing-grids">
                <div class="pricing-grid">
                    <div class="price-value">
                        <a href="#">Wesite hosting</a>
                    </div>
                    <h3><a href="#">$5.01/month</a></h3>
                    <ul>
                        <li><a href="#">Lorem ipsum</a></li>
                        <li><a href="#">Dolor sitamet, Consect</a></li>
                        <li><a href="#">Adipiscing elit</a></li>
                        <li><a href="#">Proin commodo turips</a></li>
                        <li><a href="#">Laws pulvinarvel</a></li>
                        <li><a href="#">Prnare nisi pretium</a></li>
                    </ul>
                    <div class="cart">
                        <div class="span3">
                            <a class="popup-with-zoom-anim" href="#small-dialog"><i>Purchase</i></a>
                        </div>
                    </div>
                </div>
                <div class="pricing-grid">
                    <div class="price-value">
                        <a href="#">Reseller cloud</a>
                    </div>
                    <h3><a href="#">$10.01/month</a></h3>
                    <ul>
                        <li><a href="#">Lorem ipsum</a></li>
                        <li><a href="#">Dolor sitamet, Consect</a></li>
                        <li><a href="#">Adipiscing elit</a></li>
                        <li><a href="#">Proin commodo turips</a></li>
                        <li><a href="#">Laws pulvinarvel</a></li>
                        <li><a href="#">Prnare nisi pretium</a></li>
                    </ul>
                    <div class="cart">
                        <div class="span3">
                            <a class="popup-with-zoom-anim" href="#small-dialog"><i>Purchase</i></a>
                        </div>
                    </div>
                </div>
                <div class="pricing-grid">
                    <div class="price-value">
                        <a href="#">Dedicated hosting</a>
                    </div>
                    <h3><a href="#">$20.01/month</a></h3>
                    <ul>
                        <li><a href="#">Lorem ipsum</a></li>
                        <li><a href="#">Dolor sitamet, Consect</a></li>
                        <li><a href="#">Adipiscing elit</a></li>
                        <li><a href="#">Proin commodo turips</a></li>
                        <li><a href="#">Laws pulvinarvel</a></li>
                        <li><a href="#">Prnare nisi pretium</a></li>
                    </ul>
                    <div class="cart">
                        <div class="span3">
                            <a class="popup-with-zoom-anim" href="#small-dialog"><i>Purchase</i></a>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>

                <div class="pricing-grids">
                    <div class="pricing-grid1">
                        <div class="price-value">
                            <a href="#">Wesite hosting</a>
                        </div>
                        <h3><a href="#">$5.01/month</a></h3>
                        <ul>
                            <li><a href="#">Lorem ipsum</a></li>
                            <li><a href="#">Dolor sitamet, Consect</a></li>
                            <li><a href="#">Adipiscing elit</a></li>
                            <li><a href="#">Proin commodo turips</a></li>
                            <li><a href="#">Laws pulvinarvel</a></li>
                            <li><a href="#">Prnare nisi pretium</a></li>
                        </ul>
                        <div class="cart1">
                            <div class="span3">
                                <a class="popup-with-zoom-anim" href="#small-dialog">
                                    <j>Purchase</j>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="pricing-grid2">
                        <div class="price-value">
                            <a href="#">Reseller cloud</a>
                        </div>
                        <h3><a href="#">$10.01/month</a></h3>
                        <ul>
                            <li><a href="#">Lorem ipsum</a></li>
                            <li><a href="#">Dolor sitamet, Consect</a></li>
                            <li><a href="#">Adipiscing elit</a></li>
                            <li><a href="#">Proin commodo turips</a></li>
                            <li><a href="#">Laws pulvinarvel</a></li>
                            <li><a href="#">Prnare nisi pretium</a></li>
                        </ul>
                        <div class="cart1">
                            <div class="span3">
                                <a class="popup-with-zoom-anim" href="#small-dialog">
                                    <k>Purchase</k>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="pricing-grid3">
                        <div class="price-value">
                            <a href="#">Dedicated hosting</a>
                        </div>
                        <h3><a href="#">$20.01/month</a></h3>
                        <ul>
                            <li><a href="#">Lorem ipsum</a></li>
                            <li><a href="#">Dolor sitamet, Consect</a></li>
                            <li><a href="#">Adipiscing elit</a></li>
                            <li><a href="#">Proin commodo turips</a></li>
                            <li><a href="#">Laws pulvinarvel</a></li>
                            <li><a href="#">Prnare nisi pretium</a></li>
                        </ul>
                        <div class="cart1">
                            <div class="span3">
                                <a class="popup-with-zoom-anim" href="#small-dialog">
                                    <l>Purchase</l>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="pricing-grid4">
                        <div class="price-value">
                            <a href="#">Dedicated hosting</a>
                        </div>
                        <h3><a href="#">$20.01/month</a></h3>
                        <ul>
                            <li><a href="#">Lorem ipsum</a></li>
                            <li><a href="#">Dolor sitamet, Consect</a></li>
                            <li><a href="#">Adipiscing elit</a></li>
                            <li><a href="#">Proin commodo turips</a></li>
                            <li><a href="#">Laws pulvinarvel</a></li>
                            <li><a href="#">Prnare nisi pretium</a></li>
                        </ul>
                        <div class="cart1">
                            <div class="span3">
                                <a class="popup-with-zoom-anim" href="#small-dialog">
                                    <m>Purchase</m>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-----pop-up-grid---->
                    <div id="small-dialog" class="mfp-hide">
                        <div class="pop_up">
                            <div class="payment-online-form-left">
                                <form>
                                    <h4><span class="shipping"></span>Shipping</h4>
                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" value="Frist Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Frist Name';}"></li>
                                        <li>
                                            <input class="text-box-dark" type="text" value="Last Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Last Name';}"></li>
                                    </ul>
                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}"></li>
                                        <li>
                                            <input class="text-box-dark" type="text" value="Company Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Company Name';}"></li>
                                    </ul>
                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" value="Phone" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Phone';}"></li>
                                        <li>
                                            <input class="text-box-dark" type="text" value="Address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Address';}"></li>
                                        <div class="clear"></div>
                                    </ul>
                                    <div class="clear"></div>
                                    <ul class="payment-type">
                                        <h4><span class="payment"></span>Payments</h4>
                                        <li><span class="col_checkbox">
                                            <input id="3" class="css-checkbox1" type="checkbox">
                                            <label for="3" name="demo_lbl_1" class="css-label1"></label>
                                            <a class="visa" href="#"></a>
                                        </span>

                                        </li>
                                        <li>
                                            <span class="col_checkbox">
                                                <input id="4" class="css-checkbox2" type="checkbox">
                                                <label for="4" name="demo_lbl_2" class="css-label2"></label>
                                                <a class="paypal" href="#"></a>
                                            </span>
                                        </li>
                                        <div class="clear"></div>
                                    </ul>
                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" value="Card Number" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Card Number';}"></li>
                                        <li>
                                            <input class="text-box-dark" type="text" value="Name on card" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name on card';}"></li>
                                        <div class="clear"></div>
                                    </ul>
                                    <ul>
                                        <li>
                                            <input class="text-box-light hasDatepicker" type="text" id="datepicker" value="Expiration Date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Expiration Date';}"><em class="pay-date"> </em></li>
                                        <li>
                                            <input class="text-box-dark" type="text" value="Security Code" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Security Code';}"></li>
                                        <div class="clear"></div>
                                    </ul>
                                    <ul class="payment-sendbtns">
                                        <li>
                                            <input type="reset" value="Cancel"></li>
                                        <li>
                                            <input type="submit" value="Process order"></li>
                                    </ul>
                                    <div class="clear"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-----pop-up-grid---->

                    <!-----pop-up-grid---->
                    <div id="small-dialog-login" class="ModalPopup mfp-hide">
                        <div class="pop_up">
                            <div class="payment-online-form-left">
                                <ul class="JQValidateErrors"></ul>
                                <h4><span class="glyphicon glyphicon-user"></span>Login</h4>
                                <form id="frmLogin" name="frmLogin">
                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtloginEmail" name="txtloginEmail" placeholder="Enter Email Address"></li>
                                        <div class="clear"></div>
                                    </ul>
                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtloginPassword" name="txtloginPassword" placeholder="Password"></li>
                                    </ul>
                                    <div class="clear"></div>

                                    <div class="span3">
                                        <ul class="payment-sendbtns">
                                            <li>
                                                <k> <a href="javascript:void(0)"  id="btnLoginCancel">Cancel
                                                </a></k>
                                            </li>
                                            <li>
                                                <m> <a href="javascript:void(0)"  id="btnLogin" onclick="LoginUser();" >Login</a></m>
                                            </li>

                                        </ul>
                                </form>
                                </div>
                                <div class="clear"></div>

                            </div>
                        
                    </div>
                    <!-----pop-up-grid---->
                    <!-----pop-up-grid---->
                    <div id="small-dialog-register" class="mfp-hide ModalPopup">
                        <div class="pop_up">
                            <div class="payment-online-form-left">
                                <ul class="JQValidateErrors"></ul>
                                <h4><span class="shipping"></span>Sign Up</h4>
                                <form id="frmRegister" name="frmRegister">
                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtregisterFName" name="txtregisterFName" placeholder="First Name"></li>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtregisterLName" name="txtregisterLName" placeholder="Last Name"></li>
                                    </ul>
                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtregisterEmail" name="txtregisterEmail" placeholder="Email"></li>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtregisterCEmail" name="txtregisterCEmail" placeholder="Confirm Email"></li>

                                    </ul>
                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtregisterPassword" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}"></li>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtregisterCPassword" value="Confirm Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Confirm Password';}"></li>

                                    </ul>
                                    <div class="clear"></div>

                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtregisterPhone" value="Phone Number" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Phone Number';}"></li>
                                    </ul>
                                    <div class="clear"></div>
                                    <ul>

                                        <li>
                                            <input class="text-box-dark" type="text" id="txtregisterCountry" value="Country" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Country';}"></li>

                                    </ul>
                                    <div class="clear"></div>
                                    <ul>

                                        <li>
                                            <input class="text-box-dark" type="text" id="txtregisterStreet" value="Street" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Street';}"></li>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtregisterCity" value="City" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'City';}"></li>

                                    </ul>
                                    <ul>

                                        <li>
                                            <input class="text-box-dark" type="text" id="txtregisterState" value="State" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'State';}"></li>
                                        <li>
                                            <input class="text-box-light hasDatepicker" type="text" id="txtregisterZip" value="Zip" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Zip';}"><em class="pay-date"> </em></li>

                                    </ul>
                                    <div class="clear"></div>
                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtregisterSquestion" value="Security Question" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Security Question';}"></li>
                                    </ul>
                                    <div class="clear"></div>
                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtregisterSanswer" value="Security Answer" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Security Answer';}"></li>

                                    </ul>
                                </form>
                                <div class="clear"></div>
                                <div class="span3">
                                    <ul class="payment-sendbtns">
                                        <li>
                                            <k><a href="javascript:void(0)"  id="btnRegisterCancel">Cancel</a></k>
                                        </li>
                                        <li>
                                            <m> <a href="javascript:void(0)"  id="btnRegister" onclick="RegisterUser();" >Register</a></m>
                                        </li>

                                    </ul>

                                </div>

                                <div class="clear"></div>

                            </div>
                        </div>
                    </div>
                    <!-----pop-up-grid---->
                </div>
                <div class="clear"></div>
            </div>
            <div class="client">
                <h3>
                    <img src="images/line.png" /><i>CLIENT ABOUT US</i><img src="images/line.png" /></h3>
                <div class="img">
                    <img src="images/left.png" />
                </div>
                <div class="data">
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic</p>
                    <p><a href="#">#INDUSTY</a></p>
                </div>
                <div class="img1">
                    <img src="images/right.png" />
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>

    <div id="small-dialog-register" class="mfp-hide ModalPopup">
        <div class="pop_up">
        </div>
    </div>
    <!-- Add fancyBox light-box -->
    <!-- Add fancyBox light-box -->
    <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $('.popup-with-zoom-anim').magnificPopup({
                type: 'inline',
                fixedContentPos: false,
                fixedBgPos: true,
                overflowY: 'auto',
                closeBtnInside: true,
                preloader: false,
                midClick: true,
                removalDelay: 300,
                mainClass: 'my-mfp-zoom-in'
            });
        });
    </script>
    <!-- //End fancyBox light-box -->
    <!----End-pricingplans---->
    <!-----------end-pricing------------->
    <!----------- message2 ------------>
    <div class="message2">
        <div class="wrap">
            <h3>Our team</h3>
            <p>We a professional and progresive team</p>
        </div>
    </div>
    <!----------- about ------------>
    <div class="about" id="about">
        <div class="wrap">
            <h4>About Us</h4>
            <div class="section group">
                <div class="label_1_of_4 about_1_of_4">
                    <img src="images/about1.jpg">
                    <h3>MICHAEL TURNER </h3>
                    <span>consectetur</span>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since.</p>
                </div>
                <div class="label_1_of_4 about_1_of_4">
                    <img src="images/about2.jpg">
                    <h3>JOHN SMITH </h3>
                    <span>consectetur</span>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.</p>
                </div>
                <div class="label_1_of_4 about_1_of_4">
                    <img src="images/about3.jpg">
                    <h3>ASHLEY HUNTER </h3>
                    <span>consectetur</span>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer .</p>
                </div>
                <div class="label_1_of_4 about_1_of_4">
                    <img src="images/about4.jpg">
                    <h3>TIM BIRD </h3>
                    <span>consectetur</span>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer.</p>
                </div>
            </div>
            <div class="client">
                <h3>
                    <img src="images/line.png" /><i>Our skills</i><img src="images/line.png" /></h3>
                <!----------- clock position ------------>
                <div></div>
                <div class="pie-wrapper progress-45 style-2">
                    <span class="label">45<span class="smaller">%</span></span>
                    <div class="pie">
                        <div class="left-side half-circle"></div>
                        <div class="right-side half-circle"></div>
                    </div>
                    <div class="shadow"></div>
                    <h3>WEB-DESIGN</h3>
                </div>

                <div class="pie-wrapper progress-75 style-2">
                    <span class="label">75<span class="smaller">%</span></span>
                    <div class="pie">
                        <div class="left-side half-circle"></div>
                        <div class="right-side half-circle"></div>
                    </div>
                    <div class="shadow"></div>
                    <h3>CREATIVE</h3>
                </div>

                <div class="pie-wrapper progress-95 style-2">
                    <span class="label">95<span class="smaller">%</span></span>
                    <div class="pie">
                        <div class="left-side half-circle"></div>
                        <div class="right-side half-circle"></div>
                    </div>
                    <div class="shadow"></div>
                    <h3>UI-DESIGN</h3>
                </div>
                <div class="pie-wrapper progress-45 style-2">
                    <span class="label">45<span class="smaller">%</span></span>
                    <div class="pie">
                        <div class="left-side half-circle"></div>
                        <div class="right-side half-circle"></div>
                    </div>
                    <div class="shadow"></div>
                    <h3>PROTOTYPES</h3>
                </div>
                <div class="pie-wrapper progress-75 style-2">
                    <span class="label">75<span class="smaller">%</span></span>
                    <div class="pie">
                        <div class="left-side half-circle"></div>
                        <div class="right-side half-circle"></div>
                    </div>
                    <div class="shadow"></div>
                    <h3>PHOTOGRAPHY</h3>
                </div>
            </div>
        </div>
    </div>
    <!----------- message3 ------------>
    <div class="message3">
        <div class="wrap">
            <h3>You Loked Over 6000px</h3>
            <p>That's Great!</p>
        </div>
    </div>
    <!--------start-contact----------->
    <div class="contact" id="contact">
        <div class="wrap">
            <h2>Contact Us</h2>
            <div class="contact-form">
                <div class="form">
                    <h3>MAIL</h3>
                    <form method="post" action="#">
                        <input type="text" class="textbox" value=" Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}">
                        <input type="text" class="textbox" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}">
                        <div class="clear"></div>
                        <div>
                            <textarea value="Message:" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = ' Message';}">Message</textarea>
                        </div>
                        <div class="span4">
                            <a href="#">
                                <i>
                                    <input type="submit" value="Submit mail"></i>
                                <div class="clear"></div>
                            </a>
                        </div>
                    </form>
                </div>
                <div class="para-contact">
                    <h4>MORE INFO</h4>
                    <div class="get-intouch-left-address">
                        <p>2345 Setwant natrer, 1234</p>
                        <p>Washington. United States.</p>
                        <p>2345 Setwant natrer, 1234</p>
                        <p>Washington. United States.</p>
                        <p>(401) 1234 567</p>
                        <p><a href="mailto:info@mycompany.com">info(at)appstore.com</a></p>
                    </div>
                    <div class="span4">
                        <a href="#">
                            <i>
                                <input type="submit" value="Purchase"></i>
                            <div class="clear"></div>
                        </a>
                    </div>
                    <div class="clear"></div>
                </div>
                <a class="mov-top" href="#home1"><span></span></a>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <!--------//end-contact----------->
    <!----------- message3 ------------>
    <div class="social">
        <div class="wrap">
            <h3>Connect With Us</h3>
            <p>Follow Us On Social Networks</p>
            <!---start-social-icons---->
            <div class="social-icons-set">
                <ul>
                    <li><a class="facebook" href="#"></a></li>
                    <li><a class="twitter" href="#"></a></li>
                    <li><a class="vimeo" href="#"></a></li>
                    <li><a class="rss" href="#"></a></li>
                    <li><a class="gplus" href="#"></a></li>
                    <li><a class="pin" href="#"></a></li>
                    <div class="clear"></div>
                </ul>
                <div class="clear"></div>
            </div>
            <!---//End-social-icons---->
            <div class="clear"></div>
        </div>
    </div>
    <!--- footer-top --->
    <div class="footer-top">
        <div class="wrap">
            <div class="col_1_of_3 span_1_of_3">
                <h5>RECENT TWEETS</h5>
                <h6>
                    <img src="images/twit.png" alt=""><a href="#"><span>booty, 15.10.2013</span></a></h6>
                <p>
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry
                    <lable>Lorem Ipsum has been</lable>
                    the industry's standard dummy text ever since
                </p>
                <h6>
                    <img src="images/twit.png" alt=""><a href="#"><span>booty, 15.10.2013</span></a></h6>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry </p>
            </div>
            <div class="col_1_of_3 span_1_of_3">
                <h5>RECENT POSTS</h5>
                <h6 class="a">15.10.2013</h6>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>
                <h6 class="a">15.10.2013</h6>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>
                <h6 class="a">15.10.2013</h6>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>

            </div>
            <div class="col_1_of_3 span_1_of_3">
                <h5>PHOTO STREAM</h5>
                <ul>
                    <li>
                        <img src="images/pf-1.jpg" alt=""></li>
                    <li>
                        <img src="images/pf-2.jpg" alt=""></li>
                    <li>
                        <img src="images/pf-3.jpg" alt=""></li>
                    <li>
                        <img src="images/pf-4.jpg" alt=""></li>
                    <li>
                        <img src="images/pf-5.jpg" alt=""></li>
                    <li>
                        <img src="images/pf-6.jpg" alt=""></li>
                    <li>
                        <img src="images/pf-8.jpg" alt=""></li>
                    <li>
                        <img src="images/pf-2.jpg" alt=""></li>
                    <li>
                        <img src="images/pf-4.jpg" alt=""></li>
                    <li>
                        <img src="images/pf-5.jpg" alt=""></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="wrap">
            <div class="image">
                <a href="index.html">
                    <img src="images/logo.png" alt=""></a>
            </div>
            <div class="copy-right">
                <p>Template <a href="http://w3layouts.com/">w3layouts.com</a></p>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <!-- scroll_top_btn -->
    <script src="js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.validate.js"></script>
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1200);
            });
        });
    </script>

    <script type="text/javascript" src="js/myscripts.js"> </script>
    <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
</body>
</html>
