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
import { initAutocomplete } from "../plugins/init_autocomplete";
import { field_hide } from '../components/field_hide';
import { mapBoxInitalise } from "../components/geocode";

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  new Slideshow;
  initUpdateNavbarOnScroll();
  loadDynamicBannerText();
  optionSelect();
  field_hide();
  initAutocomplete();
  mapBoxInitalise();
  if (document.querySelector('.progress-lower')) {
    progressBar();
  }

  if (document.querySelector('.seima-body')) {
    createMySiema();
  }
});
