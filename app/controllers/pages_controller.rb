class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @properties = Property.all
  end

  def new
    @user = User.find(params[:user_id])
    @booking = Booking.new
  end
end
