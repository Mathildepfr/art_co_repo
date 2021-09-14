import { formElements } from '@rails/ujs';
import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

// const mapResults = document.querySelector("#submit")
const mapForm = document.querySelector("#map-form")
const mapMarkers = document.querySelector("#map")

const callMap = (query) => {
  const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${query}.json?access_token=pk.eyJ1IjoiY2hpbGxpODE4IiwiYSI6ImNrc2ZrdjhpazFiaDMydnBhNTFrN29jbjkifQ.A9mmPD2G-OCUxKWzvNfeNQ`
  fetch(url)
  .then(response => response.json())
  .then((data) => {
    injectMap(data.features[0].geometry.coordinates)
  });
};

function grabMapInput(event) {
  event.preventDefault()
  callMap(this.elements[0].value)
}

const injectMap = (coordinates) => {
  const updateMapMarkers = JSON.parse(mapMarkers.dataset.markers)
  const mapDiv = document.getElementById('map');
  mapDiv.innerHTML = '';

  mapboxgl.accessToken = 'pk.eyJ1IjoiY2hpbGxpODE4IiwiYSI6ImNrc2ZrdjhpazFiaDMydnBhNTFrN29jbjkifQ.A9mmPD2G-OCUxKWzvNfeNQ';
  const map = new mapboxgl.Map({
    container: mapDiv,
    style: 'mapbox://styles/mapbox/streets-v9',
    center: coordinates,
    zoom: 12
  });

  if (mapMarkers) {
    updateMapMarkers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window);

      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '40px';
      element.style.height = '40px';

      new mapboxgl.Marker(element)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map);
    });

    map.addControl(new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl
    }));

    map.addControl(new mapboxgl.FullscreenControl({ container: mapDiv }));

    map.addControl(new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      trackUserLocation: true,
      showUserHeading: true
    }));

    const scale = new mapboxgl.ScaleControl({
      maxWidth: 80,
      unit: 'metric'
    });
    map.addControl(scale);

    scale.setUnit('metric');
  }
};

function mapBoxInitalise() {
  mapForm.addEventListener('submit', grabMapInput)
}

export { mapBoxInitalise }
