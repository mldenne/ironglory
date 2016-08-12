class OrderingsController < ApplicationController
  before_action :current_user
  before_action :current_order

  def create
    @ordering = current_order.orderings.create(ordering_params)
    if @ordering.id
      current_order.save
      render json: current_order
    else
      render json: @ordering.errors
    end
  end

  def update
    @ordering = current_order.orderings.find(params[:id])
    @ordering.update(ordering_params)
    render json: current_order
  end

  def destroy
    @ordering = current_order.orderings.find(params[:id])
    @ordering.destroy
    render json: current_order
  end

  private

  def ordering_params
    params.permit(:quantity, :product_id)
  end

end
