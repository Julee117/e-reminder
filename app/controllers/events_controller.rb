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

  def edit
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      @event.add_date_value
      @event.update_creator(current_user.username)
      @calendar.events << @event
      @event.add_to_calendars
      redirect_to calendar_event_path(@calendar.name, @event)
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      @event.add_date_value
      redirect_to calendar_event_path(@calendar.name, @event)
    else
      render :edit
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def set_calendar
    @calendar = current_user.calendar
  end

  def event_params
    params.require(:event).permit(:title, :note, :date, :start_time, :end_time, :creator, location_attributes: [:id, :name, :street_address, :city, :state, :zipcode], calendar_ids: [])
  end
end
