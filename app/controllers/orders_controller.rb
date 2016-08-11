class OrdersController < ApplicationController

  def fake_order
    @order = Order.find(9)
    render json: @order, include: ['orderings', 'orderings.product']
  end
end
