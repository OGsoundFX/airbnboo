class DashboardController < ApplicationController
  def index
    # list all booking of current user
    @user = current_user
    @bookings = Booking.where( user: @user)
    date = Time.now
    @future_bookings = Booking.where( "start_date > ?", date )
    @past_bookings = Booking.where( "start_date < ?", date )
  end

  def show
    # show one specific booking
  end
end
