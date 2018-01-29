class CommentsController < ApplicationController
  before_action :set_event

  def index
    @comments = @event.comments
    respond_to do |format|
      format.html
      format.json {render json: @comments}
    end
  end

  def new
    @comment = @event.comments.build
  end

  def create
    @calendar = current_user.calendar
    @comment = @event.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to calendar_event_path(@calendar.name, @event)
    else
      render :new
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :event_id, :user_id)
  end
end
