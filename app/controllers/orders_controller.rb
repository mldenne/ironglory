class OrdersController < ApplicationController

  def fake_order
    @order = Order.find(9)
    respond_to do |format|
      format.html {render :show}
      format.json { render json: @order, include: ['orderings', 'orderings.product'] }
    end
  end
end
