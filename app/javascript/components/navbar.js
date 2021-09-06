const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const whiteLogo = document.querySelector('.logo_wrapper img.white');

  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-lewagon-darkblue');
        whiteLogo.classList.add('logo-visible');
      } else {
        navbar.classList.remove('navbar-lewagon-darkblue');
        whiteLogo.classList.remove('logo-visible');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
