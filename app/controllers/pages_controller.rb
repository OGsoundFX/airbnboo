class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @properties = Property.search_by_address_and_name(params[:query])
    else
      @properties = Property.all
    end
  end
end
