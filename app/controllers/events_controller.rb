class EventsController < ApplicationController
  before_action :set_event, only: [:show, :next, :prev, :edit, :update, :destroy]
  before_action :set_calendar, only: [:index, :show, :edit, :new, :create, :update, :destroy]

  def index
    @events = current_user.sort_by_date
  end

  def show
    @comment = @event.comments.build
    respond_to do |format|
      format.html
      format.json {render json: @event}
    end
  end

  def new
    @event = Event.new
    @location = @event.build_location
  end

  def next
    @next_event = current_user.next(@event)
    render json: @next_event
  end

  def prev
    @prev_event = current_user.prev(@event)
    render json: @prev_event
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      @event.add_attribute_values(current_user.username)
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
      @event.add_to_new_calendars
      redirect_to calendar_event_path(@calendar.name, @event)
    else
      render :edit
    end
  end

  def destroy
    if @event.creator == current_user.username
      @event.destroy
      redirect_to calendar_events_path(@calendar.name)
    else
      @calendar.events.delete(@event)
      redirect_to calendar_events_path(@calendar.name)
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
    params.require(:event).permit(:title, :note, :date, :start_time, :end_time, :creator, :location_id, location_attributes: [:id, :name, :street_address, :city, :state, :zipcode, :longitude, :latitude], user_ids: [])
  end
end
