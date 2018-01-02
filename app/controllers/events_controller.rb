class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_calendar, only: [:index, :show, :edit, :new, :create, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @event = @calendar.events.build
    @location = @event.build_location
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def set_calendar
    @calendar = current_user.calendar
  end

  def event_params
    params.require(:event).permit(:title, :note, :date, :start_time, :end_time, :creator, location_attributes: [:id, :name, :street_address, :city, :state, :zipcode], user_ids: [])
  end
end
