import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const banner = document.querySelector('#banner-typed-text');
  if (banner) {
    new Typed('#banner-typed-text', {
      strings: ["Need some art?", "Find an artist, today."],
      typeSpeed: 50,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
