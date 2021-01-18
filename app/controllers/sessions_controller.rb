class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(username: params[:session][:username].downcase)
    if @user
      log_in @user
      flash[:notice] = 'You have logged in sucessfuly'
      redirect_to categories_path
    else
      flash.now[:alert] = 'Wrong username!'
      render 'new'
    end
  end

  def destroy
    session[:id] = nil
    flash[:notice] = "Logged out!"
    redirect_to categories_path
  end
end