class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  
  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save

    redirect_to restaurant_path(@review.restaurant)
  end

  def edit
  end

  def update
    @review.update(review_params)

    redirect_to restaurant_path(@review.restaurant)
  end

  def destroy
    @review.destroy

    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
