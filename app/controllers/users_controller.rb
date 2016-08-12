class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      UserNotifier.send_signup_email(@user).deliver
      session[:identifier] = @user.username
      render json: @user
    else
      render json: @user.errors
    end
  end


private

  def user_params
    params.permit(:password, :username, :firstname, :lastname, :email)
  end
end
