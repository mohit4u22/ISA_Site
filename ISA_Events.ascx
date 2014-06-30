<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ISA_Events.ascx.cs" Inherits="ISA_Events" %>
<script type="text/javascript">

    var eventsJSON;
    $(document).ready(function () {
        PopulateEvents();
    });

    function PopulateEvents() {
        $.ajax({
            type: "Get",
            url: "../WebService.asmx/GetEvents",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                eventsJSON = JSON.parse(result.d);
                var divtext = '';
                $.each(eventsJSON, function (i, item) {
                    divtext += '<div class="pricing-grid1" onclick="OpenGalleryDetail(\'' + item.ID + '\')" ><div class="price-value"><a href="#">' + item.EventName + '</a>';
                    divtext += '</div><h3><a href="#"><img width=100 height=100 src="Images/' + item.PosterPath + '" alt="' + item.EventName + '" />';
                    divtext += '</a></h3><div style="padding:10px;">' + item.EventDescription.toString().substring(0, 100) + ' ...</div><a href="javascript:void(0)" style="float:right; margin:10px;">more</a></div>';
                });
                $('#divEvents').html(divtext);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // alert(jqXHR.responseText);
            }
        });

    }

    function OpenGalleryDetail(EventID) {
        //alert(EventID);
        var selectedItem;
        $.each(eventsJSON, function (i, item) {
            if (item.ID.toString() === EventID) {
                selectedItem = item;
                return false;
            }
        });
        $('#spnEventDetailPopupHeader').html(selectedItem.EventName);
        $('#imgEventDetailPopup').attr('src', "Images\\" + selectedItem.PosterPath);
        $('#spnEventDetailPopupDescription').html(selectedItem.EventDescription);
        $.magnificPopup.open({
            items: {
                src: $('#divEventsDetail'), // can be a HTML string, jQuery object, or CSS selector
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
<div id="divEvents">
</div>

<!-----pop-up-grid---->
<div id="divEventsDetail" class="ModalPopup mfp-hide">
    <div class="pop_up">
        <div class="payment-online-form-left">
            <h4><span class="event"></span>&nbsp;&nbsp;<span id="spnEventDetailPopupHeader" style=""></span></h4>

            <br />
            <img id="imgEventDetailPopup"></img>
            <br />
            <span id="spnEventDetailPopupDescription"></span>
        </div>
        <div class="clear"></div>

    </div>

</div>

<!-----pop-up-grid---->
