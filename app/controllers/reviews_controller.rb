class ReviewsController < ApplicationController
  def create
    @animal = Animal.find(params[:animal_id])
    @review = Review.new(review_params)
    @user = current_user
    @review.animal = @animal
    @review.user = @user
    if @review.save
      redirect_to animal_path(@animal, anchor: "review-#{@review.id}")
    else
      render 'animals/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :animal)
  end
end
