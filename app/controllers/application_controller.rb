class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if session[:user_id]
      @user = User.find_by(username: session[:user_id])
      @order = @user.orders.where.not(order_status: 'complete')
    elsif session[:guest_id]
      @guest = Guest.find_by(guest_num: session[:user_id])
      @order = @guest.orders.where.not(order_status: "complete")
    else
      #need to initialize order if all orders for guest are complete. Or maybe initialize in user_sessions
      @order = Order.new
    end
    @order
  end

end
