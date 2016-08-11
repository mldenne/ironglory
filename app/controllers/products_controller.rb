class ProductsController < ApplicationController
  before_action :current_user
  before_action :current_order

  def index
    @products = Product.all
    render json: @products
  end
  def show
    @product = Product.find(params[:id])
    render json: @product
  end
end
