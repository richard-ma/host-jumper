class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Show 404 page
  # http://stackoverflow.com/questions/2385799/how-to-redirect-to-a-404-in-rails
  def not_found 
    raise ActionController::RoutingError.new('now found')
  end
end
