const progressBar = () => {
  const progress = document.getElementById("progress");
  const prev = document.getElementById("prev");
  const next = document.getElementById("next");
  const circles = document.querySelectorAll(".circle");
  const fontawesomes = document.querySelectorAll(".circle .fa-check-circle");

  let currentActive = 1;

  next.addEventListener("click", () => {
    currentActive++;
    if (currentActive > circles.length) {
      currentActive = circles.length;
    }
    update();
  });

  prev.addEventListener("click", () => {
    currentActive--;
    if (currentActive < 1) {
      currentActive = 1;
    }
    update();
  });

  function update() {
    circles.forEach((circle, idx) => {
      if (idx < currentActive) {
        circle.classList.add("activated");
      } else {
        circle.classList.remove("activated");
      }
    });

    fontawesomes.forEach((fa, idx) => {
      if (idx < currentActive) {
        fa.classList.add("yellow");
      } else {
        fa.classList.remove("yellow");
      }
    });

    const actives = document.querySelectorAll(".activated");
    progress.style.width = ((actives.length - 1) / (circles.length - 1)) * 100 + "%";

    if (currentActive === 1) {
      prev.disabled = true;
    } else if (currentActive === circles.length) {
      next.disabled = true;
    } else {
      prev.disabled = false;
      next.disabled = false;
    }
  }
}

export { progressBar }
