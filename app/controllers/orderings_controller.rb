class OrderingsController < ApplicationController
  before_action :current_order
  def create
    @order_item = @order.order_items.new(order_item_params)
    @order.save
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    @order.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order_item = @order.order_items.find(params [:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private

  def order_items_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

end
