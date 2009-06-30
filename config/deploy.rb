default_run_options[:pty] = true
set :application, "stupidss.com"
set :repository, "git@github.com:schmidtjra/Stupid Social Network.git"
set :scm, "git"
set :ssh_options, { :forward_agent => true }
set :use_sudo, false
set :domain, "stupidss.com"
set :user, "gregg"
set :port, 6969

set :branch, "master"
set :deploy_via, :remote_cache
 
set :deploy_to, "/home/gregg/public_html/#{application}"
 
role :app, domain
role :web, domain
role :db, domain, :primary => true
 
namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end

  desc "Make symlink for database.yml" 
  task :symlink_dbyaml do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" 
  end

  desc "Create empty database.yml in shared path" 
  task :create_dbyaml do
    run "mkdir -p #{shared_path}/config" 
    put '', "#{shared_path}/config/database.yml" 
  end
end

after 'deploy:setup', 'deploy:create_dbyaml'
after 'deploy:update_code', 'deploy:symlink_dbyaml'

after "deploy", "deploy:cleanup"
