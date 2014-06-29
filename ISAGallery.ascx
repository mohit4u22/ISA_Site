<%@ Control Language="C#" ClassName="ISAGallery" %>

<script runat="server">

</script>
<link rel="stylesheet" href="css/supersized.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/supersized.shutter.css" type="text/css" media="screen" />



<script type="text/javascript" src="js/supersized.3.2.7.min.js"></script>
<script type="text/javascript" src="js/supersized.shutter.min.js"></script>

<script type="text/javascript">

    var supersizedFunction;
    function start_supersized(newsl) {
        $('#supersized-loader').empty().remove();
        $('#supersized').empty().remove();
        $('#hzDownscaled').empty().remove();
        //$('body').append('<div id="supersized-loader"></div><ul id="supersized"></ul>');
        $('body').append('<ul id="supersized"></ul>');
        supersizedFunction.supersized({
            // Functionality
            slide_interval: 3000,		// Length between transitions
            transition: 3, 			// 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
            transition_speed: 700,		// Speed of transition

            // Components							
            slide_links: 'blank',	// Individual links for each slide (Options: false, 'number', 'name', 'blank')
            slides: newsl

        }); // add your other SZ options here


    };



    jQuery(function ($) {
        supersizedFunction = $;
        $('#supersized').hide();
        // PopulateGalleryFolders();
    });

    function openGallery(FolderName) {

        $.ajax({
            type: "Post",
            url: "WebService.asmx/GetGalleryFiles",
            data: "{'FolderName': '" + FolderName + "'}",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                var obj = JSON.parse(result.d);
                var newSlides = [];
                $.each(obj, function (i, item) {
                    var obj = {
                        image: location.protocol + '//' + location.host + '/Images/Gallery/' + item
                    };
                    newSlides.push(obj);
                });


                start_supersized(newSlides);
                $('#SlideshowGallery').show();
                $('#supersized').css('left', (window.outerWidth + 100) + 'px');
                $('#supersized').show();
                $('#supersized').animate({ 'left': '0' }, 1000);
               $('body').append("<a id=ancCloseGallery href='javascript:void(0);' onclick='CloseGallerySlideShow();' style='position:fixed; z-index:1000; top:10px; left:47%; height:75px; width:130px;'><img height=32 width=65 src='Images/CloseBtn.png' alt='' /></a>");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });





    }
    function CloseGallerySlideShow() {
        $('#supersized').animate({ 'left': window.outerWidth + 100 + 'px' }, 1000, function () {
           // $('#supersized').empty().remove();
            $('#supersized').remove();
            $('#SlideshowGallery').hide();
            $('#ancCloseGallery').remove();
        });
    }
</script>
<style type="text/css">
    ul#demo-block {
        margin: 0 15px 15px 15px;
    }

        ul#demo-block li {
            margin: 0 0 10px 0;
            padding: 10px;
            display: inline;
            float: left;
            clear: both;
            color: #aaa;
            background: url('img/bg-black.png');
            font: 11px Helvetica, Arial, sans-serif;
        }

            ul#demo-block li a {
                color: #eee;
                font-weight: bold;
            }
</style>

<div id="divGalleryFolders">
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
                            <p><a href="images/pf-1.jpg" data-lightbox-gallery="gallery1" id="A1">View</a> </p>
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
                        <div id="Div1">
                            <p><a href="images/pf-2.jpg" data-lightbox-gallery="gallery1" id="A2">View</a> </p>
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
                        <div id="Div2">
                            <p><a href="images/pf-3.jpg" data-lightbox-gallery="gallery1" id="A3">View</a> </p>
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
                        <div id="Div3">
                            <p><a href="images/pf-4.jpg" data-lightbox-gallery="gallery1" id="A4">View</a> </p>
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
                        <div id="Div4">
                            <p><a href="images/pf-5.jpg" data-lightbox-gallery="gallery1" id="A5">View</a> </p>
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
                        <div id="Div5">
                            <p><a href="images/pf-6.jpg" data-lightbox-gallery="gallery1" id="A6">View</a> </p>
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
                        <div id="Div6">
                            <p><a href="images/pf-7.jpg" data-lightbox-gallery="gallery1" id="A7">View</a> </p>
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
                        <div id="Div7">
                            <p><a href="images/pf-8.jpg" data-lightbox-gallery="gallery1" id="A8">View</a> </p>
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
                        <div id="Div8">
                            <p><a href="images/pf-9.jpg" data-lightbox-gallery="gallery1" id="A9">View</a> </p>
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
                        <div id="Div9">
                            <p><a href="images/pf-10.jpg" data-lightbox-gallery="gallery1" id="A10">View</a> </p>
                        </div>
                </figcaption>
            </figure>
        </li>
        <div class="clear"></div>
    </ul>
    <!-- #container -->
</div>
<!--Demo styles (you can delete this block)-->
<div id="SlideshowGallery" style="display: none;">



    <!--End of styles-->

    <!--Thumbnail Navigation-->
    <div id="prevthumb"></div>
    <div id="nextthumb"></div>

    <!--Arrow Navigation-->
    <a id="prevslide" class="load-item"></a>
    <a id="nextslide" class="load-item"></a>

    <div id="thumb-tray" class="load-item">
        <div id="thumb-back"></div>
        <div id="thumb-forward"></div>
    </div>

    <!--Time Bar-->
    <div id="progress-back" class="load-item">
        <div id="progress-bar"></div>
    </div>

    <!--Control Bar-->
    <div id="controls-wrapper" class="load-item">
        <div id="controls">

            <a id="play-button">
                <img id="pauseplay" src="img/pause.png" /></a>

            <!--Slide counter-->
            <div id="slidecounter">
                <span class="slidenumber"></span>/ <span class="totalslides"></span>
            </div>

            <!--Slide captions displayed here-->
            <div id="slidecaption"></div>

            <!--Thumb Tray button-->
            <a id="tray-button">
                <img id="tray-arrow" src="img/button-tray-up.png" /></a>

            <!--Navigation-->
            <ul id="slide-list"></ul>

        </div>
    </div>
</div>
