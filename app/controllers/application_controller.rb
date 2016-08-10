class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  private

  def current_order
     
  end

end
