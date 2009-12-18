require 'capistrano/ext/multistage'

set :application, "twitchoice.com"
set :repository,  "webfadi@webfadi.com:~/git/twitchoice.git"
set :scm,         "git"

set :stages, %w(tst qa production)
set :deploy_via, "copy"
#set :copy_cache, "#{ENV['HOME']}/deploy/#{application}"
set :copy_exclude,  ['.git']

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

#role :app, "twitchoice.com"
#role :web, "twitchoice.com"
#role :db,  "twitchoice.com", :primary => true

set :user, "deploy" #d3pl0y
set :scm_username, "webfadi"
set :use_sudo, false

namespace :deploy do
  %w(start restart).each do |name| 
    task name, :roles => :app do 
      passenger.restart
    end
  end
end

namespace :passenger do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after :deploy, "passenger:restart"
