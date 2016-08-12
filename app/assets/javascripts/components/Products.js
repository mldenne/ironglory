import React from 'react'

class Products extends React.Component  {
  constructor(props) {
    super(props)
    this.updateProducts = this.updateProducts.bind(this)
    // this.openPage = this.openPage.bind(this)
    this.state = {
      items: [],
      prodNumber: ''
    }
  }
  componentDidMount () {
    this.updateProducts()
  }
  updateProducts() {
    fetchApi('GET', '/products', {}, (response) => {
      console.log(response)
      this.setState({items: response})
    })
  }
  // openPage() {
  //   this.setState({prodNumber: product.id})
  //   fetchApi('POST', `/products/${this.state.prodNumber}`, {}, (response) => {
  //
  //
  //   })
  // }
    render() {
      var divStyle = {
        visibility: 'hidden',
        opacity: 0,
      };
      var products = this.state.items.map(function(product, key) {
        var imgStyle = {
          backgroundImage: 'url(' + product.product_image + ')'
        }
        return (
          <div className="col-xs-12 col-sm-6 col-md-3" key={key}>
            <a className="productLink">
              <div className="product" style={imgStyle}>
                <div className="hoverLayer" data={product.id}>
                  <h4 className="text-center title" style={divStyle}>{product.name}</h4>
                  <h5 className="text-center price" style={divStyle}>${product.price}</h5>
                </div>
              </div>
            </a>
          </div>
        )
      })
      return <div className="row">{products}</div>
    }
  }

  export default Products
