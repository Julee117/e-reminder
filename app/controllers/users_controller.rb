class UsersController < ApplicationController
  def index
    @events_today = current_user.today_events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      @calendar = @user.create_calendar(name: @user.username)
      redirect_to root_path
    else
      redirect_to "/signup"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
