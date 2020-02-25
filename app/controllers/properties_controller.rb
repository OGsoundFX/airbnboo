class PropertiesController < ApplicationController
  # list all properties
  def index
      @properties = Property.all
  end

# list specific properties
  def show
     @property = Property.find(params[:id])
  end

# create new properties
  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if @property.save!
      redirect_to property_path(@property)
    else
      render 'new'
    end
  end

  private

  def property_params
    params.require(:property).permit(:name, :address, :price, :haunted_level, :photo)
  end
end
