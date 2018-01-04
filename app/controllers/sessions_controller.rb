class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      render :new
    end
  end

  def facebook
    if auth = request.env["omniauth.auth"]
      if @user = User.find_by(uid: auth["uid"])
        session[:user_id] = @user.id
        redirect_to users_path
      else
        @user = User.new(email: oauth_email, username: oauth_name, password: SecureRandom.hex)
        if @user.save
          session[:user_id] = @user.id
          @calendar = @user.create_calendar(name: @user.username)
          redirect_to users_path
        else
          render :new
        end
      end
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

  private

  def auth
    request.env["omniauth.auth"]
  end

  def oauth_email
    auth["info"]["email"]
  end

  def oauth_name
    oauth_email.split("@").first
  end
end
