class LocationsController < ApplicationController
  def index
  end

  def show
    @location = Location.find(params[:id])
  end

  def popular
    @locations = Location.most_popular
  end
end
