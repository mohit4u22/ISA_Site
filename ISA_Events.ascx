<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ISA_Events.ascx.cs" Inherits="ISA_Events" %>
<style>
    /*#region radio button */
    #divEventsDetail input[type="radio"] {
        display: none;
    }

        #divEventsDetail input[type="radio"] + label {
            display: inline;
            font-size: 18px;
        }

            #divEventsDetail input[type="radio"] + label:before {
                content: '';
                display: inline-block;
                width: 32px;
                height: 32px;
                background: url(Images//radio-checked.png) no-repeat;
                vertical-align: middle;
            }

        #divEventsDetail input[type="radio"]:checked + label:before {
            content: '';
            background: url(Images/radio-unchecked.png) no-repeat;
        }
    /*#endregion */

    #UlRsvp li {
        display: inline;
        list-style-type: none;
        padding-right: 20px;
    }
</style>
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
    var selectedItem;
    function OpenGalleryDetail(EventID) {
        //alert(EventID);

        $.each(eventsJSON, function (i, item) {
            if (item.ID.toString() === EventID) {
                selectedItem = item;
                return false;
            }
        });
        $('#lblRSVPMessage').html('');
        $('#spnEventDetailPopupHeader').html(selectedItem.EventName);
        $('#imgEventDetailPopup').attr('src', "Images\\" + selectedItem.PosterPath);
        $('#spnEventDetailPopupDescription').html(selectedItem.EventDescription);
        setTimeout(function () {
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
        }, 500);
    }

    function SubmitRSVP() {
        if (!$('#radio1').prop('checked') && !$('#radio2').prop('checked')) {
            $('#lblRSVPMessage').html('<font color="red">Please select atleast one option.</font>');
            return false;
        }
        var cname = $.MyCookie.readCookie('Isa_Site_Login');
        if (cname != null) {
            var rsvp = false;
            if ($('#radio1').prop('checked'))
                rsvp = true;

            $.ajax({
                type: "Post",
                url: "../WebService.asmx/SubmitRSVP",
                data: "{'email': '" + cname + "', 'EventID': '" + selectedItem.ID.toString() + "', 'RSVP': '" + rsvp + "'}",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (result) {
                   
                    $('#lblRSVPMessage').html('<font color="green">Your request submitted successfully !!!</font>');
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    // alert(jqXHR.responseText);
                }
            });
        }
        else {
            $('#lblRSVPMessage').html('<font color="red"> Please <a onclick="ShowLogin()" style="text-decoration:underline; color:red; cursor:pointer;">Login</a> in order to submit the RSVP.</font>');
        }
    }
    var ReopenForEventID;
    function ShowLogin() {
        $('#divEventsDetail .mfp-close').click();
        setTimeout(function () {
            $('#liTopLogin a').click();
        }, 500);

        ReopenForEventID = selectedItem.ID;
    }
</script>
<div id="divEvents">
</div>

<!-----pop-up-grid---->
<div id="divEventsDetail" class="ModalPopup mfp-hide">
    <div class="pop_up">
        <div class="payment-online-form-left">

            <table>
                <tr>
                    <td>
                        <h2>RSVP</h2>
                    </td>
                    <td style="padding: 0 10px 0 10px">
                        <ul id="UlRsvp">

                            <li>
                                <input type="radio" id="radio1" name="radios" />
                                <label for="radio1">Going</label>
                            </li>
                            <li>
                                <input type="radio" id="radio2" name="radios" />
                                <label for="radio2">Not Going</label>
                            </li>
                        </ul>
                    </td>
                    <td>
                        <span><i><a onclick='SubmitRSVP();' style='color: Green; opacity: 1; text-decoration: underline; cursor: pointer;'>SUBMIT RSVP</a></i> </span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <label id="lblRSVPMessage"></label>
                    </td>
                </tr>
            </table>
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
