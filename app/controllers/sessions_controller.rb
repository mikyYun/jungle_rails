class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(username: params[:username])
    # user_email = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end