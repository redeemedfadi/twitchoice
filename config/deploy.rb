set :application, "twitchoice"
set :repository,  "http://webfadi.com/svn/twitchoice"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/webapps/#{application}"
set :copy_exclude,  ['.svn']

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "qa.twitchoice.com"
role :web, "qa.twitchoice.com"
role :db,  "qa.twitchoice.com", :primary => true

set :user, "fadi"
set :scm_username, "fadi"
set :use_sudo, true 
