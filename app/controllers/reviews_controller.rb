class ReviewsController < ApplicationController
  def new
    @animal = Animal.find(params[:animal_id])
    @review = Review.new
    @user = current_user
  end

  def create
    @review = Review.create(review_params)
    @user = current_user
    @animal = Animal.find(params[:animal_id])
    @review.animal = @animal
    @review.user = @user
    if @review.save
      redirect_to animal_path(@animal)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :animal)
  end
end
