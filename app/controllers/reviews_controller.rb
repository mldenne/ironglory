class ReviewsController < ApplicationController
  before_action :current_user
  before_action :current_order
end
