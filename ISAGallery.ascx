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
        PopulateGalleryFolders();
    });


    function PopulateGalleryFolders() {

        $.ajax({
            type: "Get",
            url: "../WebService.asmx/GetEvents",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                var obj = JSON.parse(result.d);
                var fdr = '';

                var divtext = '';
                $.each(obj, function (i, item) {
                    divtext += "<div class='label_1_of_4 about_1_of_4'><div class='ic_container'> <img  height=250 width=250 src='" + item.FolderImage + "' alt='" + item.GalleryFolderName + "' /> ><div class='ic_caption'><p class='ic_category'></p><h3>" + item.GalleryFolderName + "</h3><p class='ic_text'><span style='margin:12px;' class='span3'><i><a onclick=\"openGallery('" + item.GalleryFolderPath + "')\" href='javascript:void(0)' style='color:white; opacity:1; text-decoration:none;'>View</a></i> </span></p></div></div></div>";
                });
                $('#divGalleryFolders').append(divtext);

              
                $(".ic_container").capslide({
                    caption_color: '#fff',
                    caption_bgcolor: '#000',
                    overlay_bgcolor: '#f9ca8d',
                    border: '4px solid #000',
                    showcaption: true
                });
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // alert(jqXHR.responseText);
            }
        });

    }

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
            window.location.href = window.location.href;
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
