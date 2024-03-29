require "rvm/capistrano"

set :rvm_ruby_string, 'r328'
set :rvm_type, :user
set :application, "domwiki"
set :rails_env, "production"
set :domain, "perekup@perekup.net"
set :deploy_to, "/home/perekup/#{application}"
set :use_sudo, false
set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"

set :password, '12345trewq'
set :scm, :git
set :repository, "git@github.com:Lockerr/DOMwiki.git"
set :branch, "master"
set :deploy_via, :remote_cache
set :backup_dir, "#{deploy_to}/shared"

role :web, domain
role :app, domain
role :db, domain, :primary => true

before "deploy:assets:precompile", "bundle:install"

after 'deploy:update_code', :roles => :app do
  
  %w{database config}.each do |yaml_name|
    run "rm -f #{current_release}/config/#{yaml_name}.yml"
    run "ln -s #{deploy_to}/shared/config/#{yaml_name}.yml #{current_release}/config/#{yaml_name}.yml"
  end
  # run "cd #{current_release} ; rake db:migrate"

end

namespace :bundle do
  task :install do
    run "cd #{current_release} ; bundle install"
  end
end

task :backup, :roles => :db, :only => {:primary => true} do
  filename = "#{backup_dir}/#{application}.dump.#{Time.now.to_f}.sql.bz2"
  text = capture "cat #{deploy_to}/current/config/database.yml"
  yaml = YAML::load(text)

  on_rollback { run "rm #{filename}" }
  run "mysqldump -u #{yaml['production']['username']} -p #{yaml['production']['database']} | bzip2 -c > #{filename}" do |ch, stream, out|
    ch.send_data "#{yaml['production']['password']}\n" if out =~ /^Enter password:/
  end
end

namespace :deploy do

  task :restart do
    run "if [ -f #{unicorn_pid} ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{deploy_to}/current && bundle exec unicorn_rails -c #{unicorn_conf} -E #{rails_env} -D; fi"
  end
  task :start do
    run "cd #{deploy_to}/current && bundle exec unicorn_rails -c #{unicorn_conf} -E #{rails_env} -D"
  end
  task :stop do
    run "if [ -f #{unicorn_pid} ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
  end

  task :migrate do
    run "cd #{deploy_to}/current && bundle exec rake db:migrate"
  end


end

