<%@ Control Language="C#" ClassName="ISAGMap" %>

<script runat="server">

</script>

<style type="text/css">
    div.markerTooltip, div.markerDetail {
        color: black;
        font-weight: bold;
        background-color: white;
        white-space: nowrap;
        margin: 0;
        padding: 2px 4px;
        border: 1px solid black;
    }
</style>
<script src="http://maps.google.com/maps?file=api&v=2.x&key=AIzaSyDXMFlkWGN-dDVzy0ERh54poNkIGmzk8kI"
    type="text/javascript"></script>
<script type="text/javascript" src="js/pdMarker.js"></script>


<div style="background-color: #282A2E; height: 45%; width: 55%;">
    <div style="float: left; width: 200px;">
        <ul id="ulMapSideLinks">
            <li><a href="javascript:void(0)" name="RKGrocery">R.K. Grocery</a></li>
            <li><a href="javascript:void(0)" name="Puran">Puran Indian Restaurent </a></li>
              <li><a href="javascript:void(0)" name="Walmart">Walmart</a></li>
            <li><a href="javascript:void(0)" name="Target">Target</a></li>
        </ul>
    </div>
    <div style="float: right;">
        <div id="map" style="width: 600px; height: 600px;"></div>
        <!-- // define a place for PdMarker to calculate tooltip widths (optional) -->
        <div id="pdmarkerwork"></div>
    </div>
</div>
<script type="text/javascript">
    //<![CDATA[
    window.onload = onPageLoad;
    var map;
    var locations = {
        "RKGrocery": {
            "Name": "RK Groceries - Indian Grocery Store",
            "Latitude": "40.511147",
            "Longitude": "-88.958144",
            "Description": "RK Groceries - 106 Young Dr, Normal, 61761",
            "Phone": "(309) 454-5527",
            "Website": "http://www.yelp.com/biz/r-k-grocery-normal"
        },
        "Puran": {
            "Name": "Puran Indian Restaurant",
            "Latitude": "40.484553",
            "Longitude": "-88.950282",
            "Description": "P40.514203uran Indian Restaurant - 1704 Eastland Drive, Bloomington, IL 61761",
            "Phone": "(309) 454-5527",
            "Website": "http://www.puranindian.com/"
        },
          "Walmart": {
              "Name": "Walmart Normal",
              "Latitude": "40.514203",
              "Longitude": "-88.990631",
              "Description": "300 Greenbriar Dr, Normal, IL 61761",
    "Phone": "(309) 451-1100",
    "Website": "http://www.walmart.com/storeLocator/ca_storefinder_details_short.do?edit_object_id=1125"
    },
    "Target": {
        "Name": "Puran Indian Restaurant",
        "Latitude": "40.514203",
        "Longitude": "-88.990631",
        "Description": "301 S Veterans Pkwy, Normal, IL 61761",
        "Phone": "(309) 454-5648",
        "Website": "http://www.target.com/store-locator/store-details/storeNumber=137#?afid=storeloc&cpng=IL&lnm=Bloomington-Normal_137"
    }
    }

    function codeAddress(addr) {
        var geocoder = new google.maps.Geocoder();

        geocoder.geocode({ 'address': addr }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                //In this case it creates a marker, but you can get the lat and lng from the location.LatLng
                //map.setCenter(results[0].geometry.location);
                //var marker = new google.maps.Marker({
                //    map: map,
                //    position: results[0].geometry.location
                //});
                return results[0].geometry.location;
            } else {
                //alert("Geocode was not successful for the following reason: " + status);
            }
        });
    }

    function onPageLoad() {
        if (GBrowserIsCompatible()) {

            var yelpaddr = 'http://api.yelp.com/business_review_search?term=Walmart&location=Normal%20IL&ywsid=DU3nRZlsFRHLmSv1qZDL9g';

            $.getJSON(yelpaddr + '&callback=?',
         function (data) {
             $.each(data.businesses, function (i, bus) {
                 var ltlg = codeAddress(bus.address1 + ' ' + bus.address2 + ' ' + bus.city + ' ' + bus.state + ' '+ bus.zip);

             });

             map = new GMap2(document.getElementById("map"));

             map.setCenter(new GLatLng(locations.RKGrocery.Latitude, locations.RKGrocery.Longitude), 17 - 5);
             map.addControl(new GLargeMapControl());
             map.addControl(new GMapTypeControl());
             var id = 0;
             $.each(locations, function (i, item) {
                 id++;
                 var marker = new PdMarker(new GLatLng(item.Latitude, item.Longitude));
                 marker.setId(id);
                 // marker.setTooltip("Vancouver");
                 var html = "<div style='padding:10px;'>" + item.Description;
                 if (item.Phone && item.Phone.toString().length > 0)
                     html += "<br>Phone: " + item.Phone;
                 if (item.Website && item.Website.toString().length > 0)
                     html += "<br>Web: " + item.Website;
                 html += "</div>";
                 marker.setDetailWinHTML(html);
                 marker.setHoverImage("http://www.google.com/mapfiles/dd-start.png");
                 marker.setTooltip(item.Description);
                 map.addOverlay(marker);

             });
         }
     );



            // var transitLayer = new google.maps.TransitLayer();
            // transitLayer.setMap(map);
            $('#ulMapSideLinks a').click(function (e) {
                var Clickeditem = $(this).attr("Name");
                var itm = null;
                var index = 0;
                $.each(locations, function (name, item) {
                    index++;
                    if (name == Clickeditem) {
                        itm = item;
                        return false;
                    }

                });

                if (itm != null) {

                    var mk = map.getMarkerById(index);
                    map.setCenter(new google.maps.LatLng(itm.Latitude, itm.Longitude));
                    map.setZoom(22);
                    map.zoomToMarkers(5);
                    mk.blink(true, 500);
                    setTimeout(function () {
                        mk.blink(false, 0);
                        mk.hideTooltip();
                    }, 5000);
                    mk.showTooltip();


                }
            });

        }
    }


</script>
