class OrdersController < ApplicationController

  before_action :current_user, except: [:fake_order]
  before_action :current_order, except: [:fake_order]

  def update
    if params[:user_info]
    end
  end

  def fake_order
    @order = Order.find(9)
    render json: @order, include: ['orderings', 'orderings.product']
  end
end
