import mapboxgl from 'mapbox-gl';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'individual-map',
    style: 'mapbox://styles/mapbox/streets-v9'
  });
};

const addMarkersToMap = (map, marker) => {
  new mapboxgl.Marker()
    .setLngLat([marker.lng, marker.lat])
    .addTo(map);
};

const fitMapToMarkers = (map, marker) => {
  const bounds = new mapboxgl.LngLatBounds();
  bounds.extend([marker.lng, marker.lat]);
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('individual-map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.marker);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);

    map.addControl(new mapboxgl.FullscreenControl({ container: mapElement }));

    map.addControl(new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      trackUserLocation: true,
      showUserHeading: true
    }));
  }
};

export { initMapbox };
