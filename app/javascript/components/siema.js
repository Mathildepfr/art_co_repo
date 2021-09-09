import Siema from 'siema';

const createMySiema = () => {
  const mySiema = new Siema({
    // selector: '.siema',
    // duration: 200,
    // easing: 'ease-out',
    // perPage: 1,
    // startIndex: 0,
    draggable: false
    // multipleDrag: true,
    // threshold: 20,
    // loop: false,
    // rtl: false,
    // onInit: () => { },
    // onChange: () => { },
  });
  const prev = document.querySelector('.prev');
  const next = document.querySelector('.next');

  prev.addEventListener('click', () => mySiema.prev(1));
  next.addEventListener('click', () => mySiema.next(1));
}

export { createMySiema };
