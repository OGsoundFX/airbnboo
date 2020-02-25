class BookingsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to property_path(@booking.property_id)
    else
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :property_id)
  end
end
