class ApplicationController < ActionController::Base

  helper_method :current_order

  def current_order
    @order = current_user.orders.where.not(order_status: "Complete").last
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
      @guest = Guest.create(guest_num: SecureRandom.hex(10))
      session[:guest_id] = @guest.guest_num
    end
    if @user
      @user
    else
      @guest
    end
  end

end
