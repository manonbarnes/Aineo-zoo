class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @user = current_user
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new(params_bookings)
    @booking.animal = @animal
    @booking.user = @user
      if @booking.save
        redirect_to bookings_path
      else
        render 'new'
      end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(params_bookings)

    redirect_to booking_path(@booking)
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @animal = Animal.find(params[:animal_id])
  end

  private

  def params_bookings
    params.require(:booking).permit(:user, :animal, :start_time, :start_date, :status, :duration)
  end
end
