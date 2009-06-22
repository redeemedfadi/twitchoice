set :application, "twitchoice.com"
set :repository,  "webfadi@webfadi.com:~/git/twitchoice.git"
set :scm,         "git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/webapps/#{application}"
#set :deploy_via, "copy"
#set :copy_cache, "#{ENV['HOME']}/deploy/#{application}"
#set :copy_exclude,  ['.git']

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "twitchoice.com"
role :web, "twitchoice.com"
role :db,  "twitchoice.com", :primary => true

set :user, "deploy" #d3pl0y
set :scm_username, "webfadi"
set :use_sudo, false
