import React from 'react'

class Item extends React.Component  {
  constructor(props) {
    super(props)
    this.updateProducts = this.updateProducts.bind(this)
    this.state = {
      items: []
    }
  }
  componentDidMount () {
    this.updateProducts()
  }
  updateProducts() {
    fetchApi('GET', `/products/${window.location.search.slice(4)}}`, {}, (response) => {
      console.log(response)
      this.setState({items: response})
    })
  }
    render() {
        return (
          <div className="container">
            <div className="row">
              <div className="col-xs-12 col-sm-5 col-md-5 col-md-offset-1">
                <img className="productImage img-responsive" src={this.state.items.product_image}></img>
              </div>
              <div className="col-xs-12 col-sm-7 col-md-5">
                <h1 className="prodTitle">{this.state.items.name}</h1>
                <h3>${this.state.items.price}</h3>
                <h5 className="text-left">{this.state.items.description}</h5>
                <button className="btn btn-default">ADD TO CART</button>
                <hr />
                <div className="form-group">
                  <label htmlFor="comment">Comments</label>
                  <textarea className="form-control" rows="5" id="commentBox"></textarea>
                </div>
                <div className="comments">

                </div>
              </div>
            </div>
          </div>
        )
    }
  }

  export default Item
