require 'mina/bundler'
require 'mina/git'

set :domain, '173.203.111.48'
set :deploy_to, '/var/www/html/seesparkbox.sparkboxqa.com'
set :repository, 'git@github.com:sparkbox/sparkbox-website.git'
set :branch, 'master'
# Using ssh agent forwarding, using our local credentials to checkout from Github:
set :ssh_options, '-A'

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['log']

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  # invoke :'rvm:use[ruby-1.9.3-p125@default]'
end

task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'

    to :launch do
      queue "npm install"
      queue "grunt dist"
      queue "ln -s #{deploy_to}/shared/fonts dist/css/fonts"
      queue "touch #{deploy_to}/tmp/restart.txt"
    end
  end
end