<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
      html { height: 100% }
      body { height: 100%; margin: 0; padding: 0 }
      #map_canvas { height: 50%; width: 50% }
    </style>
    <script type="text/javascript"
      src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAaH0a_RfosurL-9riQl4AVMO0xn0vcOPM&sensor=false">
    </script>
    <script type="text/javascript">
      function initialize() {
        var myOptions = {
          center: new google.maps.LatLng(45.412874,-122.571584),
          zoom: 15,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map_canvas"),
            myOptions);
        var marker = new google.maps.Marker({
            position: map.center,
            map: map,
            title: 'Click to zoom'
          });
        google.maps.event.addListener(map, 'center_changed', function() {
            // 3 seconds after the center of the map has changed, pan back to the
            // marker.
            window.setTimeout(function() {
              map.panTo(marker.getPosition());
            }, 3000);
          });

          google.maps.event.addListener(marker, 'click', function() {
            map.setZoom(20);
            map.setCenter(marker.getPosition());
          });
      }
    </script>
  </head>
  <body onload="initialize()">
    <div id="map_canvas" ></div>
  </body>
</html>