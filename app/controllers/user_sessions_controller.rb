class UserSessionsController < ApplicationController
  before_action :require_user, only: [:destroy]

  def create
    @user = User.find_by(username: params[:username])
    if @user
      if @user.authenticate(params[:password])
        if session[:identifier]
          @guest = Guest.find_by(guest_num: session[:identifier])
          if @guest && @guest.orders.length == 0
            @guest.destroy
          end
        end
        session[:identifier] = @user.username
        render json: @user
      else
        render json: {errors: "Incorrect password"}, :status => 422
      end
    end
  end

  def show
    if session[:identifier]
      @user = User.find_by(username: session[:identifier])
      @guest = Guest.find_by(guest_num: session[:identifier])
    else
      @guest = Guest.create!
      session[:identifier] = @guest.guest_num
    end
    if @user
      render json: @user
    elsif @guest
      render json: @guest
    end
  end

  #can everyone be guest user until they sign in?
  #Guest user is destroyed on overwriting session unless they have an order that they own.
  #can I set callback methods that render current_user but still go through? I doubt it.

  def destroy
    session[:identifier] = nil
    @guest = Guest.create!
    session[:identifier] = @guest.guest_num
    render json: @guest, :status => 200
  end

end
