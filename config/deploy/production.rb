#set :deploy_to, "/var/www/webapps/#{application}/production"
role :app, "webfadi.com"
role :web, "webfadi.com"
role :db,  "webfadi.com", :primary => true

set :deploy_to, "/home/webfadi/twitchoice.com/"
set :user, "webfadi"
