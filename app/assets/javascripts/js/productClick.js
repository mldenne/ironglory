fetchApi('GET', '/products', {}, (response) => {
  document.body.addEventListener('click', function(e){
    var itemNumber
    if (e.target.classList.contains('hoverLayer') || e.target.classList.contains('title') || e.target.classList.contains('price')) {
      itemNumber = e.target.getAttribute('data')
      if (production) {
        redirect('/products/' + itemNumber)
      }
       else {
         redirect('/product.html?id=' + itemNumber)
       }
      // fetchApi('GET',`/products/${itemNumber}`, {}, function (response, statusCode) {
      //     console.log('it worked')
      //     console.log(response)
      // })
    }
  })
})
