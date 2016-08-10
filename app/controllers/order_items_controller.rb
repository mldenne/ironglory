class OrderItemsController < ApplicationController
  def create
    if session[:guest_id] || session[:user_id]
      @order = current_order
      @order_item = @order.order_items.new(order_item_params)
      @order.save
    end
  end

  def update
    if session[:guest_id] || session[:user_id]
      @order = current_order
      @order_item = @order.order_items.find(params[:id])
      @order.update_attributes(order_item_params)
      @order_items = @order.order_items
    end
  end

  def destroy
    if session[:guest_id] || session[:user_id]
      @order = current_order
      @order_item = @order.order_items.find(params [:id])
      @order_item.destroy
      @order_items = @order.order_items
    end
  end

  private

  def order_items_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

end
