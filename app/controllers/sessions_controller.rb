class SessionsController < ApplicationController
  
  def new; end

  def create
    user = User.where(username: params[:username]).first
    if user and user.authenticate(params[:password]) 
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.username}!"
      redirect_to root_path
    else
      flash[:error] = "Your username or password was incorrect."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are logged out."
    redirect_to root_path
  end
end