class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    # Memoization
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # Return boolean
    !!current_user
  end

end
