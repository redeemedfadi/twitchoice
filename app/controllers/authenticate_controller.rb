class AuthenticateController < ApplicationController

  def login
    oauth = Twitter::OAuth.new(ConsumerConfig["token"], ConsumerConfig["secret"])
    session["rtoken"] = oauth.request_token.token
    session["rsecret"] = oauth.request_token.secret
    redirect_to oauth.request_token.authorize_url
  end

  def authorize
    oauth = Twitter::OAuth.new(ConsumerConfig["token"], ConsumerConfig["secret"])
    oauth.authorize_from_request(session['rtoken'], session['rsecret'])

    session['rtoken'] = nil
    session['rsecret'] = nil

    client = Twitter::Base.new(oauth)
    info = client.verify_credentials

    user = User.get_or_create_user(info)
    user.update_attributes({
      :atoken => oauth.access_token.token, 
      :asecret => oauth.access_token.secret,
      :image => info.profile_image_url
    })

    session[:client_id] = user.id
    session[:twitter_id] = user.twitter_id
    session[:username] = user.username

    redirect_to root_url
  end

  def logout
    reset_session
    redirect_to root_url
  end

end
