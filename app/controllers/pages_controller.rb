class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @properties = Property.search_by_address_and_name(params[:query])
    else
      @properties = Property.limit(6).order(haunted_level: :desc)
    end
  end
end
