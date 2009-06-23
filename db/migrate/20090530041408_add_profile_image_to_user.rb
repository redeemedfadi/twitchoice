class AddProfileImageToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :image, :string
    User.find(:all).each do |user| 
      if user.twitter_id
        user.image = Twitter.user(user.twitter_id).profile_image_url
        user.save
      end
    end
  end

  def self.down
    remove_column :users, :image
  end
end


    
