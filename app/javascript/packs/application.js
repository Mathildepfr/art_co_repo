// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { Slideshow } from '../components/slideshow';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { loadDynamicBannerText } from '../components/banner';
import { optionSelect } from '../components/option_select';
import { createMySiema } from '../components/siema';
import { progressBar } from '../components/progressBar';
import { injectCoordinates, injectMap } from '../components/geocode';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  new Slideshow;
  initUpdateNavbarOnScroll();
  loadDynamicBannerText();
  optionSelect();
  createMySiema();
  progressBar();
  // injectMap();
  // injectCoordinates();
});

// const results = document.querySelector("#submit");

// const displayMap = (query) => {
//   fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${query}.json?access_token=pk.eyJ1IjoiY2hpbGxpODE4IiwiYSI6ImNrc2ZrdjhpazFiaDMydnBhNTFrN29jbjkifQ.A9mmPD2G-OCUxKWzvNfeNQ`)
//     .then(response => response.json())
//     .then((data) => {
//       // console.log(data)
//       const longitude = data.features[0].center[0];
//       const latitude = data.features[0].center[1];
//       const coordinatesTag = `<p>${longitude}, ${latitude}</p>`;
//       results.insertAdjacentHTML("beforeend", coordinatesTag);
//     });
// };

// const form = document.querySelector('#form');

// form.addEventListener('submit', (event) => {
//   event.preventDefault();
//   console.log(results);
//   const input = event.currentTarget.querySelector('.form-control');
//   results.innerHTML = '';
//   displayMap(input.value);
// });
