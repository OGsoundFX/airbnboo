class PropertiesController < ApplicationController
  # list all properties
  def index
  @properties = Property.geocoded #returns flats with coordinates

  @markers = @properties.map do |property|
    {
      lat: property.latitude,
      lng: property.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { property: property }),
      image_url: helpers.asset_url('custom_marker.png')
    }
  end
  end

# list specific properties
  def show
    @user = current_user
    @property = Property.find(params[:id])
    @booking = Booking.new
    # @booking = Booking.find(property_id = @property.id)
    @booking.property = @property
  end

# create new properties
  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if @property.save
      redirect_to property_path(@property)
    else
      render 'new'
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
  end

  private

  def property_params
    params.require(:property).permit(:name, :address, :price, :haunted_level, :photo)
  end
end
