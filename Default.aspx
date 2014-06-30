<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/ISAGMap.ascx" TagName="ISAGmap" TagPrefix="uc" %>
<%@ Register Src="~/ISAGallery.ascx" TagName="ISAGallery" TagPrefix="uc" %>
<%@ Register Src="~/ISA_Events.ascx" TagName="ISAEvents" TagPrefix="uc" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Indian Students Association</title>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900' rel='stylesheet' type='text/css'>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="css/magnific-popup1.css">

    <link rel="stylesheet" type="text/css" href="css/prettyPhoto.css">
    <!--  jquery plguin -->
    <script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
    <script src="js/jquery-ui.min.js"></script>

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



        function OpenServicePdf(Url) {
            $('#frmNewServicePDF').attr('src', Url);
            $.magnificPopup.open({
                items: {
                    src: $('#small-dialog-NewServicePDF'), // can be a HTML string, jQuery object, or CSS selector
                    type: 'inline'
                },
                fixedContentPos: false,
                fixedBgPos: true,
                overflowY: 'auto',
                closeBtnInside: true,
                preloader: false,
                midClick: true,
                removalDelay: 300,
                mainClass: 'my-mfp-zoom-in'
            });
        }
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
    <div id="fb-root"></div>
    <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
    <!-- start header -->
    <div class="header_bg">
        <div class="wrap">
            <div class="header">
                <div class="logo">
                    <h1><a href="default.aspx">
                        <img src="images/logonew.png" alt="" /></a></h1>

                </div>
                <div class="h_right">
                    <ul class="menu">
                        <li class="active"><a href="#home">Home</a></li>

                        <li><a href="#BoardMembers" class="scroll">Board Members</a></li>
                        <li><a href="#services" class="scroll">Services</a></li>
                        <li><a href="#portfolio" class="scroll">Event Gallery</a></li>
                        <li><a href="#pricing" class="scroll">Pricing</a></li>
                        <li>
                            <a class="popup-with-zoom-anim" href="#small-dialog-login"><i>Login</i></a>
                        </li>
                        <li>
                            <a class="popup-with-zoom-anim" href="#small-dialog-register"><i>Register</i></a>
                        </li>
                        <%-- <li><a href="#about" class="scroll">About</a></li>--%>
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
                            <h4 class="title">Welcome To Indian Students Association</h4>
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
                <h2>Our Services</h2>

                <p>
                    The Indian Students Association would like to extend a warm welcome to all new Aspirants joining us here in Illinois State University, Normal, IL this fall.
                    We are excited to have you and look forward to helping you make the most of your college experience.
                    In order for us to be able to help you out,
                     we will sometimes require some information from you in order to tailor our services to your needs and preferences.
                </p>

                <h3>Airport Pickup and Temporary Accomodation (or APTA)</h3>
                <p>
                    These are the wildly popular services offered to incoming students by the ISA.
                    We offer to pick you up from the Airports or any other major venue and arrange for your housing for a few days until your housing arragements fall into place.
                    We try to make your first few days as informational, entertaining and comforting as possible.
                    Please sign up for the above services and we will make sure you are taken care of! Lastly, we know you all are excited about coming to Normal and the Illinois State University and a lot of you have shown enthusiasm about becoming a part of ISA.
We look forward to welcoming you into the fold, and promise you that we will have booths set up at all our events in order to ensure you can join our ranks whenever you like!
Watch out for cool deals we arrange for members of the ISA family throughout the year, and make sure you don't miss out!
                </p>

                <p>
                    If you have questions regarding any service of ISA, please contact:
Ankit Rathore
                    <a style="transition: all 0.5s ease-out; color: azure;" href="mailto:arathore@gmail.com">arathore@gmail.com</a>
                </p>
                <div class="clear"></div>
                <br />
                <br />
                <a href="javascript:void(0)" onclick="OpenServicePdf('http://www.isaosu.com/data/new_students_guide.pdf')">
                    <div class="images_1_of_4">
                        <img src="images/cal.png">
                        <h3><a href="#">NEW STUDENTS GUIDE</a></h3>
                        <p>Lorem ipsum is simply dummy text of the printing and typesetting industry.Lorem ipsum has been </p>
                    </div>
                </a>
                <div class="images_1_of_4">
                    <img src="images/port.png">
                    <h3><a href="#">VACCINES AND IMMUNIZATIONS</a></h3>
                    <p>Lorem ipsum is simply dummy text of the printing and typesetting industry.Lorem ipsum has been</p>
                </div>
                <div class="images_1_of_4">
                    <img src="images/recyle.png">
                    <h3><a href="#">LIFE IN AMERICA</a></h3>
                    <p>Lorem ipsum is simply dummy text of the printing and typesetting industry.Lorem ipsum has been </p>
                </div>
                <div class="images_1_of_4">
                    <img src="images/camera.png">
                    <h3><a href="#">RESTAURANTS</a></h3>
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
            <h3 style="color: white; bacground-color: black; opacity: 0.5;">“Each of us is a unique strand in the intricate web of life and here to make a contribution.”</h3>
            <h2 style="color: white; background-color: black; opacity: 0.5; font-size: 2em; font-weight: 400;">Want to contribute something to the community?</h2>
            <div class="buttons">
                <%-- <div class="span1">
                    <a href="#">
                        <i>Purchase</i>
                        <div class="clear"></div>
                    </a>
                </div>--%>
                <div class="span2">
                    <a class="popup-with-zoom-anim" href="#small-dialog-donate">
                        <i>Donate</i>
                        <%-- <div class="clear"></div>--%>
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
                        <h3 class="heading">Event Gallery</h3>
                        <h6></h6>
                    </div>
                    <!--end:section-title-->
                    <br />
                </div>
                <!--end:wrapper-->

                <uc:ISAGallery ID="ISAGallery" runat="server" />
                <div class="clear"></div>
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

    <div id="divGMapWrapper" class="cbp-so-scroller">
        <!--Portfolio-->
        <div id="divGMap" class="clearfix">
        </div>
    </div>

    </div>
    <!----------- message1 ------------>
    <div class="message2">
        <div class="wrap">
            <h3>Our team</h3>
            <p>We a professional and progresive team</p>
        </div>
    </div>

    <!-----------start-pricing----------->
    <div class="pricing-plans" id="pricing">
        <div class="wrap">
            <h3>ISA Service Forms</h3>
            <div class="pricing-grids">
                <div class="pricing-grid">
                    <div class="price-value">
                        <a href="#">Accomodation</a>
                    </div>
                    <h3><a href="#">$5.01/month</a></h3>
                    <h3>Illinois State University has a wide range of accommodation options and most students find
                        that we have an accommodation solution to suit their needs.
If you would prefer not to live in University accommodation, we can also offer you advice
                        and assistance on finding private rented accommodation.</h3>
                    <div class="cart">
                        <div class="span3">
                            <a class="popup-with-zoom-anim" href="#small-dialog"><i>Purchase</i></a>
                        </div>
                    </div>
                </div>

                <div class="pricing-grid">
                    <div class="price-value">
                        <a href="#">Need Any Help? Register!</a>
                    </div>
                    <h3>ISA at ISU will be glad to provide services of accomodation and Pick up. Please fill up the registation
                    forms on the left and right to avail these services.</h3>
                    <br />
                    <br />
                    <h3><a href="#">Some Other ISU Serices are</a></h3>
                    <ul>
                        <li><a href="#">ISA Library</a></li>
                        <li><a href="#">Academic Help</a></li>
                        <li><a href="#">Alumni Guidance</a></li>
                    </ul>
                    <div class="cart">
                        <div class="span3">
                            <a class="popup-with-zoom-anim" href="#small-dialog"><i>Purchase</i></a>
                        </div>
                    </div>
                </div>
                <div class="pricing-grid">
                    <div class="price-value">
                        <a href="#">Pick Up Service</a>
                    </div>
                    <h3><a href="#">$10.01/month</a></h3>
                    <h3>ISA tries to do the best it can to pick new students up from the airport.
                        So to avoid any inconvenience please fill up the forms and wait until someone contacts you.
                        Feel free to contact in case there is any concern.
                        <br />
                        Again, ISA is a student organization,
                        and pick-up arrangements are done by volunteers on the basis of their availibility
                        and proximity. We do not guarantee a pick up.

                    </h3>
                    <div class="cart">
                        <div class="span3">
                            <a class="popup-with-zoom-anim" href="#small-dialog-pickup"><i>Purchase</i></a>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>


                <div class="pricing-grids">
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
                                                <k> <a href="javascript:void(0)" onclick="ResetForm('frmLogin')"  id="btnLoginCancel">Cancel
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
                                            <input class="text-box-dark" type="text" id="txtregisterPassword" name="txtregisterPassword" placeholder="Password"></li>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtregisterCPassword" name="txtregisterCPassword" placeholder="Confirm Password"></li>

                                    </ul>
                                    <div class="clear"></div>

                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtregisterPhone" name="txtregisterPhone" placeholder="Phone Number"></li>
                                    </ul>
                                    <div class="clear"></div>
                                    <ul>

                                        <li>
                                            <select name="ddlCountry" id="ddlCountry" style="margin-right: 5%;"></select>
                                        </li>
                                    </ul>
                                    <div class="clear"></div>
                                    <ul>

                                        <li>
                                            <input class="text-box-dark" type="text" id="txtregisterStreet" name="txtregisterStreet" placeholder="Street"></li>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtregisterCity" name="txtregisterCity" placeholder="City"></li>

                                    </ul>
                                    <ul>

                                        <li>
                                            <select name="ddlState" id="ddlState" style="margin-right: 5%;"></select>
                                        <li>
                                            <input class="text-box-light hasDatepicker" type="text" id="txtregisterZip" name="txtregisterZip" placeholder="Zip"><em class="pay-date"></em></li>

                                    </ul>
                                    <div class="clear"></div>
                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtregisterSquestion" name="txtregisterSquestion" placeholder="Security Question"></li>
                                    </ul>
                                    <div class="clear"></div>
                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtregisterSanswer" name="txtregisterSanswer" placeholder="Security Answer"></li>

                                    </ul>
                                    <div class="clear"></div>
                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="checkbox" id="chkregistersendemail" name="chkregistersendemail"></li>
                                    </ul>
                                </form>
                                <div class="clear"></div>
                                <div class="span3">
                                    <ul class="payment-sendbtns">
                                        <li>
                                            <k><a href="javascript:void(0)" onclick="ResetForm('frmRegister')"  id="btnRegisterCancel">Cancel</a></k>
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
                    <!-----pop-up-grid---->
                    <div id="small-dialog-pickup" class="mfp-hide ModalPopup">
                        <div class="pop_up">
                            <div class="payment-online-form-left">
                                <ul class="JQValidateErrors"></ul>
                                <h4><span class="shipping"></span>Pick Up Form</h4>
                                <form id="frmPickup" name="frmPickup">
                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtpickupFName" name="txtpickupFName" placeholder="First Name"></li>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtpickupLName" name="txtpickupLName" placeholder="Last Name"></li>
                                    </ul>
                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtpickupEmail" name="txtpickupEmail" placeholder="Email"></li>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtpickupPhone" name="txtpickupPhone" placeholder="Phone Number"></li>

                                    </ul>

                                    <div class="clear"></div>
                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtpickupFlight" name="txtpickupFlight" placeholder="Flight Name/Number"></li>
                                    </ul>
                                    <div class="clear"></div>
                                    <ul>
                                        <%-- <li>
                                            <input class="text-box-light hasDatepicker" type="date" id="datepicker" value="Expiration Date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Expiration Date';}"><em class="pay-date"> </em></li>--%>
                                        <li>
                                            <input class="text-box-dark" type="date" id="txtpickupArrivalDate" name="txtpickupArrivalDate" value="yyyy-mm-dd" onkeypress="return false"></li>


                                    </ul>
                                    <div class="clear"></div>
                                    <ul>

                                        <li>
                                            <input class="text-box-dark" type="time" id="txtpickupTime" name="txtpickupTime" placeholder="Street"></li>

                                    </ul>
                                    <ul>

                                        <li>
                                            <input class="text-box-dark" type="text" id="txtpickupAirport" name="txtpickupAirport" placeholder="Airport"></li>

                                    </ul>
                                    <div class="clear"></div>
                                    <ul>

                                        <li>
                                            <input class="text-box-dark" type="text" id="txtpickupVenue" name="txtpickupVenue" placeholder="Venue"></li>

                                    </ul>
                                    <div class="clear"></div>
                                    <ul>
                                        <li>
                                            <textarea class="text-box-dark" id="txtpickupComment" name="txtpickupComment" cols="40" rows="4" placeholder="Additional Comments"></textarea></li>
                                    </ul>
                                </form>
                                <div class="clear"></div>
                                <div class="span3">
                                    <ul class="payment-sendbtns">
                                        <li>
                                            <k><a href="javascript:void(0)" onclick="ResetForm('frmPickup')"  id="btnpickupCancel">Cancel</a></k>
                                        </li>
                                        <li>
                                            <m> <a href="javascript:void(0)"  id="btnpickup" onclick="PickupUser();" >Request</a></m>
                                        </li>

                                    </ul>

                                </div>

                                <div class="clear"></div>

                            </div>
                        </div>
                    </div>
                    <!-----pop-up-grid---->

                    <!-----pop-up-grid---->
                    <div id="small-dialog-donate" class="mfp-hide ModalPopup">
                        <div class="pop_up">
                            <div class="payment-online-form-left">
                                <ul class="JQValidateErrors"></ul>
                                <h4><span class="shipping"></span>Information Form - Donation</h4>
                                <form id="frmDonate" name="frmDonate">
                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtdonateFName" name="txtdonateFName" placeholder="First Name"></li>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtdonateLName" name="txtdonateLName" placeholder="Last Name"></li>
                                    </ul>
                                    <ul>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtdonateEmail" name="txtdonateEmail" placeholder="Email"></li>
                                        <li>
                                            <input class="text-box-dark" type="text" id="txtdonatePhone" name="txtdonatePhone" placeholder="Phone Number"></li>

                                    </ul>

                                    <div class="clear"></div>

                                    <ul>
                                        <li>
                                            <textarea class="text-box-dark" id="txtdonateComment" name="txtdonateComment" cols="40" rows="4" placeholder="Additional Comments/Description"></textarea></li>
                                    </ul>
                                    <ul>
                                        <li>
                                            <h3>Someone from the Board committee will contact you soon!</h3>
                                            <li>
                                    </ul>
                                </form>
                                <div class="clear"></div>
                                <div class="span3">
                                    <ul class="payment-sendbtns">
                                        <li>
                                            <k><a href="javascript:void(0)" onclick="ResetForm('frmDonate')"  id="btndonateCancel">Cancel</a></k>
                                        </li>
                                        <li>
                                            <m> <a href="javascript:void(0)"  id="btndonate" onclick="DonateUser();" >Send</a></m>
                                        </li>

                                    </ul>

                                </div>

                                <div class="clear"></div>

                            </div>
                        </div>
                    </div>
                    <!-----pop-up-grid---->

                    <!-----pop-up-grid---->
                    <div id="small-dialog-NewServicePDF" class="mfp-hide ModalPopup_850">
                        <div class="pop_up">
                            <div class="payment-online-form-left">


                                <iframe id="frmNewServicePDF" width="800" height="1084"></iframe>

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

    <!----------- message1 ------------>
    <div class="message2">
        <div class="wrap">
            <h3>Our team</h3>
            <p>We a professional and progresive team</p>
        </div>
    </div>

    <!-----------start-pricing----------->
    <div class="pricing-plans">
        <div class="wrap">
            <div class="wrapper clearfix">
                <div class="section-title">
                    <h3 class="heading">Events</h3>
                    <h6></h6>
                </div>
                <!--end:section-title-->
                <br />
            </div>
            <!--end:wrapper-->



            <uc:ISAEvents ID="ucISaEvents" runat="server" />
            <div class="clear"></div>
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
    <div class="BoardMembers" id="BoardMembers">
        <div class="wrap">
            <h4>Board Members</h4>
            <div class="section group" id="divBoardMembersWrapper">
            </div>
        </div>
    </div>

    <div class="message2">
        <div class="wrap">
            <h3>Our team</h3>
            <p>We a professional and progresive team</p>
        </div>
    </div>
    <!----------- about ------------>
    <div class="BoardMembers" id="Div1">
        <div class="wrap">
            <h4>Map</h4>
            <div class="section group" id="div2">
                <uc:ISAGmap ID="ucISAGMap" runat="server" />
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <!----------- message3 ------------>
    <div class="message3">
        <div class="wrap">
            <h3>Serving for the people, By the people</h3>
            <p>That's Great!</p>
        </div>
    </div>
    <di---->
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
                        <p>Indian Students Association</p>
                        <p>Bone Student Center</p>
                        <p>Illinois State University, Normal, IL, 61761</p>
                        <p>(309) 750 4438</p>
                        <p><a href="mailto:president@isaatisu.com">president@isaatisu.com</a></p>
                    </div>
                    <br /><br />
                    <div class="buttons">
                        <div class="span2">
                        <a href="https://illinoisstate.collegiatelink.net/organization/indian-student-association">
                            <i>ISA Profile at ISU</i>
                        </a>
                    </div>
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
                  <a class="twitter-timeline" href="https://twitter.com/isaatisu" data-widget-id="483472365469188096">Tweets by @isaatisu</a>
<script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + "://platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } }(document, "script", "twitter-wjs");</script>

            </div>
            <div class="col_1_of_3 span_1_of_3">
               <iframe src="http://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2FISAATISU&width=400&colorscheme=light&show_faces=true&border_color&stream=true&header=true&height=600" scrolling="yes" frameborder="0" style="border:none; overflow:hidden; width:400px; height:600px; background: white; float:left; " allowtransparency="true"></iframe>

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
                    <img src="images/logonew.png" alt=""></a>
            </div>
            <div class="copy-right">
                <p><a href="http://isaatisu.com/">© isaatisu.com All rights reserved.</a></p>
                <p>Developed By: <a href="mailto:mohitjain0890@gmail.com">Mohit Jain</a></p>
            </div>
            <div class="clear"></div>
        </div>
    </div>

    <!-- scroll_top_btn -->

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
