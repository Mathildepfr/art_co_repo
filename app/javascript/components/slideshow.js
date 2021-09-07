let slideIndex = 0;

const showSlides = () => {
  let i;
  const slides = document.querySelectorAll('.mySlides');
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slideIndex++;
  if (slideIndex > slides.length) { slideIndex = 1 }
  slides[slideIndex - 1].style.display = "block";
  setTimeout(showSlides, 5000);
}

export { showSlides };
