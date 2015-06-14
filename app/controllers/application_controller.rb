class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # to be able to access these methods in our "views"
  helper_method :current_user, :logged_in?
  
  def current_user
    # wil only assign @current_user with DB lookup if on different page
    # basically is the only assign @current_user if doesn't exist already approach
    @current_user ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end
  
  def logged_in?
    # the !! turns anything into a boolean?? strange
    !!current_user
  end
end
