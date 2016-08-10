class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if !session[:identifier].nil?
      Order.find(session[:identifier])
    else
      Order.new
    end
  end

end
