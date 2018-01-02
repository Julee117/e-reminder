class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      @user = user
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    if session[:user_id]
      session.delete(:user_id)
      redirect_to "/login"
    else
      redirect_to users_path
    end
  end
end
