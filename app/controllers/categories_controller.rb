class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json {render json: @categories, each_serializer: CategoryIndexSerializer}
    end
  end

  def show
    @category = Category.find(params[:id])
    render json: @category
  end
end
