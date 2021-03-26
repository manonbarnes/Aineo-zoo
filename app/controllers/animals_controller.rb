class AnimalsController < ApplicationController
  def index
    if params[:query].present?
      @animals = Animal.search_by_category(params[:query])
    else
      @animals = Animal.all
    end
    @animals = Animal.all



    @markers = @animals.map do |animal|

      if animal.user.geocoded?

        {
          lat: animal.user.latitude,
          lng: animal.user.longitude,
          infoWindow: render_to_string(partial: "animal_window", locals: { animal: animal })
        }
      end
    end
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

  private

  def params_animals
    params.require(:animal).permit(:name, :sex, :age, :category, :description, :personality_attributes, :photo, :user)
  end
end

