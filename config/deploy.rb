# coding: utf-8
require 'mina/rails'
require 'mina/git'
# require 'mina/rbenv'  # for rbenv support. (https://rbenv.org)
# require 'mina/rvm'    # for rvm support. (https://rvm.io)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :application_name, 'orats'
set :domain, 'b1dong.com'
set :deploy_to, '/root/orats'
set :repository, 'https://github.com/lokiiart/orats.git'
set :branch, 'master'
set :term_mode, nil
set :user, 'root' 

# Optional settings:
#   set :user, 'foobar'          # Username in the server to SSH to.
#   set :port, '30000'           # SSH port number.
#   set :forward_agent, true     # SSH forward_agent.

# shared dirs and files will be symlinked into the app-folder by the 'deploy:link_shared_paths' step.
# set :shared_dirs, fetch(:shared_dirs, []).push('somedir')
# set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/secrets.yml')

# This task is the environment that is loaded for all remote run commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  # invoke :'rvm:use', 'ruby-1.9.3-p125@default'
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  # command %{rbenv install 2.3.0}
  command %{mkdir -p "/root/orats"}

end

desc "Deploys the current version to the server."
task :deploy do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    command 'docker-compose restart --user "$(id -u):$(id -g)" website' 
    # command 'docker-compose up --build  -d'
    # command 'docker-compose exec --user "$(id -u):$(id -g)" website rails db:reset' # 重置数据库了，不可用
    # command 'docker-compose exec --user "$(id -u):$(id -g)" website rails db:migrate'

    on :launch do
      in_path(fetch(:current_path)) do
        command %{mkdir -p tmp/}
        command %{touch tmp/restart.txt}
      end
    end
  end

  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run(:local){ say 'done' }
end

task :update do
  invoke :'git:clone'
end

task :resartnginx do
  invoke :'git:clone'
  command 'docker-compose restart --user "$(id -u):$(id -g)" nginx' 
end

task :restartwebsite do
  invoke :'git:clone'
  command 'docker-compose restart --user "$(id -u):$(id -g)" website' 
end

task :restartgem do
  invoke :'git:clone'
  command 'docker-compose exec --user "$(id -u):$(id -g)" website bundle install' 
  command 'docker-compose restart --user "$(id -u):$(id -g)" website' 
end

task :restartdb do
  invoke :'git:clone'
  command 'docker-compose exec --user "$(id -u):$(id -g)" website rails db:reset' # 重置数据库了，不可用
  command 'docker-compose exec --user "$(id -u):$(id -g)" website rails db:migrate'
end

# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs
