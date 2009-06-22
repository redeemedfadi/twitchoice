# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '9158c27a5ac7caea7a7363b637effa28'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  rescue_from Twitter::Unauthorized, :with => :twitter_unauthorized
  rescue_from Twitter::Unavailable, :with => :twitter_unavailable
  
  def logged_in?
    session[:client_id] && session[:twitter_id]
  end

  def current_user
    User.find_by_id(session[:client_id]) || User.new
  end

  def String.random_alphanumeric
    (1..5).collect { 
      (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr
    }.join
  end
  
  private
    def twitter_unauthorized(exception)
      redirect_to login_url
    end    

    def twitter_unavailable
      flash[:notice] = "We had a problem connecting to Twitter"
      redirect_to root_url
    end
  
end
