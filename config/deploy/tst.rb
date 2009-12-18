role :app, "webfadi.com"
role :web, "webfadi.com"
role :db,  "webfadi.com", :primary => true

set :deploy_to, "/home/webfadi/test.twitchoice.com/"
set :user, "webfadi"
