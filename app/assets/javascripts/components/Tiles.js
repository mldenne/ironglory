import React from 'react'

class Tiles extends React.Component  {
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
    fetchApi('GET', '/', {}, (response) => {
      console.log(response)
      this.setState({items: response})
    })
  }
  redirect() {
    window.location.href
  }
    render() {
      var tiles = this.state.items.map(function(tile, key) {
        var imgStyle = {
          backgroundImage: `url( ${tile.featured_pic})`,
          borderRadius: 5,
          opacity: 0.8
        }
        return (
          <div className="text-container cl-effect-18" style={imgStyle} key={key}>
            <h3 className="tile text-center"><a className="tile-text" href="products.html" data-hover="Category">{tile.name}</a></h3>
          </div>
        )
      })
      return (
        <div className="container tile-container">
          {tiles}
          <div className="text-container cl-effect-18 tileAll">
            <h3 className="tile text-center"><a className="tile-text" href="/products.html" data-hover="Category">View All</a></h3>
          </div>
        </div>
      )
    }
  }

  export default Tiles
