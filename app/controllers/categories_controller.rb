class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories
  end

  def show
    @category = Category.find(params[:id])
    render json: @category
  end
end


def index
    if params[:page] && current_user
      render json: current_user, scope: {page: params[:page]}, serializer: UserWithTweetsSerializer, meta: {total_pages: current_user.timeline_tweets.count/25}
    elsif current_user
      render json: current_user, serializer: UserWithTweetsSerializer
    elsif params[:page]
      @tweets = Tweet.all.page(params[:page])
      render json: @tweets
    else
      @tweets = Tweet.all.order(created_at: :desc).page(params[:page])
      render json: @tweets
    end
  end
