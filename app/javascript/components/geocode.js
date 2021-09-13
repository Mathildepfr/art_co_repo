import { formElements } from '@rails/ujs';
import mapboxgl from 'mapbox-gl';

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

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};



// const injectCoordinates = (coordinates) => {
//   const paragraphElement = document.getElementById('coordinates');
//   paragraphElement.innerText = `${coordinates.lat}, ${coordinates.lng}`;
// };

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

      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map);
    });
    // fitMapToMarkers(map, updateMapMarkers);
  }
  // new mapboxgl.Marker()
  //   // .setLngLat([updateMapMarkers[0].lat, updateMapMarkers[0].lng])
  //   .setLngLat([144.9789, 37.8011])
  //   .addTo(map);
};

mapForm.addEventListener('submit', grabMapInput)



// export { injectCoordinates, injectMap };
