class PropertiesController < ApplicationController
  # list all properties
  def index
    if params[:query].present?
      @properties = Property.search_by_address_and_name(params[:query])
    else
      @properties = Property.all
    end
    geocode(@properties)
  end

  # list specific properties
  def show
    @user = current_user
    @property = Property.find(params[:id])
    @bookings = Booking.all.select { |booking|  booking.property == @property }
    @booking = Booking.new
    @users = User.all
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
      render "new"
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
  end

  private

  def geocode(properties)
    properties.geocoded #returns flats with coordinates
    @markers = properties.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { property: property }),
        image_url: helpers.asset_url("custom_marker.png"),
      }
    end
  end

  def property_params
    params.require(:property).permit(:name, :address, :price, :haunted_level, :photo)
  end
end
