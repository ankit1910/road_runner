# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'road_runner'
set :repo_url, 'git@github.com:ankit1910/road_runner.git'
set :deploy_to, "/var/www/apps/road_runner"
set :scm, :git
set :deploy_via, :remote_cache
set :use_sudo, false
set :user, :vinsol
set :stages, %w(production)
set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
