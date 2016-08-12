import React from 'react'

class Cart extends React.Component  {
  constructor(props) {
    super(props)
    this.updateProducts = this.updateProducts.bind(this)
    this.update = this.updateProducts.bind(this)
    this.state = {
      items: [],
      quantity: 1
    }
  }
  componentDidMount () {
    this.updateProducts()
  }
  updateProducts() {
    fetchApi('GET', '/cart', {}, (response) => {
      console.log(response)
      this.setState({items: response})
    })
  }
  quantity () {
    var quantity = document.getElementById('quantity')

    if (quantity.value === 0) {
      // destroy
    }
    else {
      this.setState({quantity: quantity.value})
    }
  }
    render() {
      var cartItems = this.state.items.map(function(product, key) {
        return (
          <div className="invContainer">
            <div className="imgContainer">
              <img src={product.product_image} alt="" />
            </div>
            <div className="textContainer">
              <div className="titleContainer">
                <h3 className="productTitle">{product.name}</h3>
              </div>
              <div className="priceContainer">
                <h5 className="price">{product.price}</h5>
              </div>
              <div className="quantityContainer">
                <div className="quantitySubContainer">
                  <h5 className="quantityText">Quantity: </h5><input id="quantity" placeholder="1">{this.state.quantity}</input>
                </div>
              </div>
              <div className="updateContainer">
                <a onClick={this.update}><h5 className="update">Update</h5></a>
              </div>
            </div>
          </div>
        )
      })
      return <div className="col-sm-6 col-md-6 cartInventory">{cartItems}</div>
    }
  }

  export default Cart
