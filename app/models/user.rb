class User < ActiveRecord::Base
  has_many :questions
  has_many :votes

  attr_accessible :username, :twitter_id, :atoken, :asecret, :image
  
  def self.get_or_create_user(info)
    user = User.find_by_twitter_id(info.id)
    user = User.new(:username => info.screen_name, :twitter_id => info.id) unless user
    user
  end

  def authorized?
    !atoken.blank? && !asecret.blank?
  end
  
  def oauth
    @oauth ||= Twitter::OAuth.new(ConsumerConfig['token'], ConsumerConfig['secret'])
  end
  
  def client
    @client ||= begin
      oauth.authorize_from_access(atoken, asecret) if atoken && asecret
      Twitter::Base.new(oauth)
    end
  end
  
  def profile_image_url
    image || Twitter.user(twitter_id).profile_image_url || "/images/tc_bigger.png"
  end
  
  def to_s
    username
  end

  def update_image
    image = Twitter.user(twitter_id).profile_image_url
  end
  
end
