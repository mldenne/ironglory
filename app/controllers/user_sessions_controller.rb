class UsersSessionsController < ApplicationController
  before_action :require_user, only: [:destroy]

  def create
    @user = User.find_by(username: params[:username])
    if @user
      if @user.authenticate(params[:password])
        session[:username] = @user.username
        render json: @user
      else
        render json: {errors: "Incorrect password"}, :status => 422
      end
    else
      render json: {errors: "User not found"}, :status => 422
    end
  end

  def destroy
    session[:username] = nil
    render json:, :status => 200
  end

end
