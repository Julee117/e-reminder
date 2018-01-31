class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :next, :prev]

  def index
    @user_locations = current_user.today_events
  end

  def show
    respond_to do |format|
      format.html
      format.json {render json: @location}
    end
  end

  def next
    @next_location = @location.next
    render json: @next_location
  end

  def prev
    @prev_location = @location.prev
    render json: @prev_location
  end

  def popular
    @locations = Location.most_popular
    respond_to do |format|
      format.html
      format.json {render json: @locations}
    end
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end
end
