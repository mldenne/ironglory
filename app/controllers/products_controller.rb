class ProductsController < ApplicationController
  before_action :current_user
  before_action :current_order

  def index
    @products = Product.all
    respond_to do |format|
      format.html
      format.json {render json: @products}
    end
  end

  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @product}
    end
  end
end
