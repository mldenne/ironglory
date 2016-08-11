class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories, each_serializer: CategoryIndexSerializer
  end

  def show
    @category = Category.find(params[:id])
    render json: @category
  end
end
