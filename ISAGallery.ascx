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
        $('body').append('<div id="supersized-loader"></div><ul id="supersized"></ul>');
        supersizedFunction.supersized({ slides: newsl }); // add your other SZ options here


    };



    jQuery(function ($) {
        supersizedFunction = $;
        $('#supersized').hide();
      
    });

    function openGallery() {
        var newSlides = [			// Slideshow Images
                                      { image: 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/kazvan-1.jpg', title: 'Image Credit: Maria Kazvan', thumb: 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/kazvan-1.jpg', url: 'http://www.nonsensesociety.com/2011/04/maria-kazvan/' },
                                                      { image: 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/kazvan-2.jpg', title: 'Image Credit: Maria Kazvan', thumb: 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/kazvan-2.jpg', url: 'http://www.nonsensesociety.com/2011/04/maria-kazvan/' },
                                                      { image: 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/kazvan-3.jpg', title: 'Image Credit: Maria Kazvan', thumb: 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/kazvan-3.jpg', url: 'http://www.nonsensesociety.com/2011/04/maria-kazvan/' },
                                                      { image: 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/wojno-1.jpg', title: 'Image Credit: Colin Wojno', thumb: 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/wojno-1.jpg', url: 'http://www.nonsensesociety.com/2011/03/colin/' },
                                                      { image: 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/wojno-2.jpg', title: 'Image Credit: Colin Wojno', thumb: 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/wojno-2.jpg', url: 'http://www.nonsensesociety.com/2011/03/colin/' },
                                                      { image: 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/wojno-3.jpg', title: 'Image Credit: Colin Wojno', thumb: 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/wojno-3.jpg', url: 'http://www.nonsensesociety.com/2011/03/colin/' },
                                                      { image: 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/shaden-1.jpg', title: 'Image Credit: Brooke Shaden', thumb: 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/shaden-1.jpg', url: 'http://www.nonsensesociety.com/2011/06/brooke-shaden/' },
                                                      { image: 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/shaden-2.jpg', title: 'Image Credit: Brooke Shaden', thumb: 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/shaden-2.jpg', url: 'http://www.nonsensesociety.com/2011/06/brooke-shaden/' },
                                                      { image: 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/shaden-3.jpg', title: 'Image Credit: Brooke Shaden', thumb: 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/shaden-3.jpg', url: 'http://www.nonsensesociety.com/2011/06/brooke-shaden/' }

        ];
        start_supersized(newSlides);
        $('#SlideshowGallery').show();
        $('#supersized').show();

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

<div>
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
                            <p><a href="javascript:void(0);" onclick="openGallery();" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">View</a> </p>
                        </div>
                    </footer>
                </figcaption>
            </figure>

        </li>
    </ul>
</div>
<!--Demo styles (you can delete this block)-->
<div id="SlideshowGallery" style="display: none;">

    <ul id="demo-block">
        <li><a href="http://buildinternet.com/project/supersized/" target="_blank">
            <img src="img/supersized-logo.png" /></a></li>
        <li>Photographers: <a href="http://cargocollective.com/mariakazvan" target="_blank">Maria Kazvan</a>, <a href="http://colindub.com" target="_blank">Colin Wojno</a>, &amp; <a href="http://brookeshaden.com/" target="_blank">Brooke Shaden</a></li>
    </ul>

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
