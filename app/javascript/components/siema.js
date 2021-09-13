import Siema from 'siema';

const createMySiema = () => {
  const mySiema = new Siema({
    draggable: false
  });
  const prev = document.querySelector('.prev');
  const next = document.querySelector('.next');

  prev.addEventListener('click', () => mySiema.prev(1));
  next.addEventListener('click', () => mySiema.next(1));
}

export { createMySiema };
