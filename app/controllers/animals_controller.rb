class AnimalsController < ApplicationController
  def index
    if params[:query].present?
      @animals = Animal.search_by_category(params[:query])
    else
      @animals = Animal.all
    end

    @markers = @animals.map do |animal|
      if animal.user.geocoded?
        {
          lat: animal.user.latitude,
          lng: animal.user.longitude,
          animalWindow: render_to_string(partial: "animal_window", locals: { animal: animal })
        }
      end
    end
    get_animal
  end

  def create
    @user = current_user
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
    @user = current_user
    @review = Review.new
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
  end

  def new
    @animal = Animal.new
  end

  def get_animal
    @page = @animals.each_slice(6).to_a
  end

  private

  def params_animals
    params.require(:animal).permit(:name, :sex, :age, :category, :description, :personality_attributes, :photo, :user)
  end
end

