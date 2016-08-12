class CategoriesController < ApplicationController
  before_action :current_user
  before_action :current_order
  def index
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json {render json: @categories, each_serializer: CategoryIndexSerializer}
    end
  end

  def show
    @category = Category.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @category}
    end
  end
end
