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

# desc "Deploys the current version to the server."
task :deploy do
  run :local do
    command %{git add .}
    command %{git commit -m "`date`"}
    command %{git push -u origin master}
  end
  invoke :'git:ensure_pushed'
  deploy do
    invoke :'git:clone'
    command %{docker-compose stop}
    command %{docker-compose up --build -d}
    # command 'docker-compose exec --user "$(id -u):$(id -g)" website rails assets:precompile'
    # command 'docker-compose exec --user "$(id -u):$(id -g)" website rails db:migrate'
    # command %{docker-compose up -d}
  end
end


task :update do
  # run :local do
  #   command %{git push -u origin master}
  # end
  invoke :'git:ensure_pushed'
  deploy do
    invoke :'git:clone'
    command %{docker-compose up --build -d}
    command 'docker-compose exec --user "$(id -u):$(id -g)" website rails assets:precompile'
    command 'docker-compose exec --user "$(id -u):$(id -g)" website rails db:migrate'
    command %{docker-compose up -d}
  end
end
# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs
