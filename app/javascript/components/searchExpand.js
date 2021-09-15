const searchExpand = () => {
  const searchicon = document.querySelector('#search-clicker');
  const search = document.querySelector('#searchbarID');
  const searchClass = search.className;
  const form = document.querySelector('.search-entry');


  searchicon.addEventListener('click', function () {
    if (searchClass === 'search-field-click') {
      console.log('this is working')
      form.submit()
    } else {
    search.classList.add('search-field-click')
    search.classList.remove('search-field')
    }
  })
}

export { searchExpand }
