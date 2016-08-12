class OrderStatusesController < ApplicationController

  def show
    respond_to do |format|
      format.html {render :checkout}
      format.json {}
    end
  end

  def thank_you
    respond_to do |format|
      format.html
      format.json {}
    end
  end
end
