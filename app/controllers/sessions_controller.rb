class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user
      session[:user_id] = user.id
      flash[:notice] = 'You have logged in sucessfuly'
      redirect_to categories_path
    else
      flash.now[:alert] = 'Wrong username!'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to categories_path
  end
end