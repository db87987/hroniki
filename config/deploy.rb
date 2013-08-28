require 'rvm/capistrano'
require 'bundler/capistrano'

load 'deploy/assets'

server "5.178.80.26", :web, :app, :db, primary: true

set :user, "user"
set :application, "hroniki"
set :deploy_to, "/home/user/projects/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:babrovka/hroniki.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true


task :copy_database_config do
   db_config = "#{shared_path}/database.yml"
   run "cp #{db_config} #{latest_release}/config/database.yml"
end


namespace(:thin) do
  task :stop do
    run "thin stop -C /etc/thin/hroniki.yml"
   end
  
  task :start do
    run "thin start -C /etc/thin/hroniki.yml"
  end

  task :restart do
    run "thin restart -C /etc/thin/hroniki.yml"
  end
end


before "deploy:assets:precompile", "copy_database_config"
after "deploy", "deploy:cleanup"