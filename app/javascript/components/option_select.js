const optionSelect = (arr) => {
  const images = document.querySelectorAll('#medium-grid .box-image');
  images.forEach((image) => {
    image.addEventListener('click', (event) => {
      const imageContainer = event.currentTarget
      const checkboxId = imageContainer.dataset.checkbox
      const checkbox = document.getElementById(checkboxId)
      checkbox.checked = !checkbox.checked;
      imageContainer.classList.toggle("box-select")
    })
  });
}

export { optionSelect };
