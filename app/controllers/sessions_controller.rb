class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'Logged in succesfully'
      redirect_to user
    else
      # flash.now because there's no redirect
      flash.now[:alert] = 'Incorrect email or password'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have successfully logged out'
    redirect_to root_path
  end

end
