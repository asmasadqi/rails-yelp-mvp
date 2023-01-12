class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @review.restaurant = set_restaurant
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = set_restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'reviews/new', status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
