class BookingsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @booking = Booking.new
  end

  def create
    @user = User.find(params[:user_id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    # if @booking.save
    #   redirect_to # user dashboard
    # else
    #
    # end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :property_id)
  end
end
