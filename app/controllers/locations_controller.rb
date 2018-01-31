class LocationsController < ApplicationController
  def index
    @user_locations = current_user.today_events
  end

  def show
    @location = Location.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @location}
    end 
  end

  def popular
    @locations = Location.most_popular
    respond_to do |format|
      format.html
      format.json {render json: @locations}
    end
  end
end
