# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def logged_in?
    session[:client_id] && session[:twitter_id]
  end
end
