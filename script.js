var map = L.map("map").setView([35.362222, 138.731389], 5);
L.tileLayer("https://cyberjapandata.gsi.go.jp/xyz/std/{z}/{x}/{y}.png", {
  attribution: "<a href='http://maps.gsi.go.jp/development/ichiran.html'>標準地図 (地理院タイル)</a>"
}).addTo(map);

fetch("https://cyberjapandata.gsi.go.jp/xyz/20160414kumamoto_0416uav/2/3/1.geojson")
  .then(function(a) {
    return a.json();
  })
  .then(function(geojson) {
    var layer = L.geoJson(geojson, {
      pointToLayer: function(feature, latlng) {
        return L.marker(latlng, {
          title: feature.properties.name
        }).bindPopup(function(marker) {
          var div = document.createElement("div");
          riot.mount(div, "my-popup", marker.feature);
          return div;
        }, {
          maxWidth: 420,
          minWidth: 420
        });
      }
    });
    map.addLayer(layer).fitBounds(layer.getBounds());
  })
  .catch(function() {
    console.log(arguments);
  });
