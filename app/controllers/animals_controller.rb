class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def create
    @user = User.find(params[:user_id])
    @animal = Animal.new(params_animals)
    @animal.user = @user
      if @animal.save
        redirect_to animals_path
      else
        render 'new'
      end
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to animals_path
  end

  def update
    @animal = Animal.find(params[:id])
    @animal.update(params_animals)
    redirect_to animals_path
  end

  def edit
    @animal = Animal.find(params[:id])
    redirect_to animal_path(@animal)
  end

  def new
    @animal = Animal.new
  end

  private

  def params_animals
    params.require(:animal).permit(:name, :sex, :age, :category, :description, :personality_attributes, :photo, :user)
  end
end
