require 'rvm/capistrano'
require 'bundler/capistrano'
require "delayed/recipes"  
require 'thinking_sphinx/capistrano'
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

task :copy_social_config do
   social_config = "#{shared_path}/social.yml"
   run "cp #{social_config} #{latest_release}/config/social.yml"
end

namespace :deploy do
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end
end

namespace(:thin) do
  task :stop do
    run %Q{cd #{latest_release} && bundle exec thin stop -C /etc/thin/hroniki.yml}
   end
  
  task :start do
    run %Q{cd #{latest_release} && bundle exec thin start -C /etc/thin/hroniki.yml}
  end

  task :restart do
    rrun %Q{cd #{latest_release} && bundle exec thin restart -C /etc/thin/hroniki.yml}
  end
end

# after 'deploy:update_code', 'thinking_sphinx:rebuild'
after "deploy:stop",    "delayed_job:stop"
after "deploy:start",   "delayed_job:start"
after "deploy:restart", "delayed_job:restart"
before "deploy:assets:precompile", "copy_database_config"
before "deploy:assets:precompile", "copy_social_config"
after "deploy", "deploy:cleanup"