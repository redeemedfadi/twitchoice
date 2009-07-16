namespace "twitchoice" do
  desc "Update All Users Images"
  task :update_user_images => :environment do
    require "app/models/user"
    User.find(:all).each do |u|
      puts u.update_image
    end
  end
end
