class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    raise
  end

  def create
    raise
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
