const field_hide = (arr) => {
  const checkboxes = document.querySelectorAll('.search-check');

  checkboxes.forEach((check) => {
    check.addEventListener('change', function() {
      const div = document.querySelector(`#${check.name}_field`);
      if (this.checked) {
        div.hidden = false;
      } else {
        div.hidden = true;
      }

      checkboxes.forEach( (check2) => {
        const div = document.querySelector(`#${check2.name}_field`);
        if (check2.checked) {
          div.hidden = false;
        } else {
          div.hidden = true;
        }
      });
    })
  });
}


export { field_hide }
