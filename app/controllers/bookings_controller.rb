class BookingsController < ApplicationController
  def show
    @property = Property.find(params[:property_id])
  #  @booking = Booking.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      @booking.status = true
      redirect_to user_dashboard_index_path(current_user)
    else
      render 'new'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :property_id, :status, :id)
  end
end
