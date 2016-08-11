class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    @order = current_user.orders.where.not(order_status: "Complete")
    unless @order
      @order = Order.create!
      current_user.orders << @order
    end
    @order
  end

  def current_user
    if session[:guest_id] || session[:user_id]
      @user = User.find_by(username: session[:user_id])
      @guest = Guest.find_by(guest_num: session[:guest_id])
    else
      @guest = Guest.create!
      session[:guest_id] = @guest.guest_num
    end
    if @user
      render json: @user
    elsif @guest
      render json: @guest
    end
  end

end
