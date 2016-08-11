class OrdersController < ApplicationController
  before_action :current_user
  before_action :current_order

  def show
    render json: current_order
  end
end
