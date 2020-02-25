class PropertiesController < ApplicationController
  # list all properties
  def index
      @properties = Property.all
  end

# list specific properties
  def show
    @user = current_user
    @property = Property.find(params[:id])
    @booking = Booking.new
    @booking.property = @property
  end

# create new properties
  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.save
    # redirect_to
  end

  private

  def property_params
    params.require(:property).permit(:name, :address, :price, :haunted_level)
  end
end
