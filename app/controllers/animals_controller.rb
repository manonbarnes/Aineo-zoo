class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def create
    @user = User.find(params[:user_id])
    @animal = Animal.new(animal_params)
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
  end

  def update
  end

  def edit
  end

  def new
    @animal = Animal.new
  end

  private

  def params_animals
    params.require(:animal).permit(:name, :sex, :age, :category, :description, :personality_attributes, :photos, :user)
  end
end
