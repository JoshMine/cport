set :application, 'cport'
set :repo_url, 'git@github.com:JoshMine/cport.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :scm, :git

set :format, :pretty
set :log_level, :debug
set :pty, true

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 2

namespace :deploy do

  desc "Deploy"
  task :default do
    update
    migrate
    restart
    cleanup
  end

  desc "Deploy and run migrations"
  task :migrations do
    update
    migrate
    restart
    cleanup
  end

  desc "Run pending migrations on already deployed code"
  task :migrate do
    run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec rake db:migrate"
  end


  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  namespace :assets do
    task :precompile do
      run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec rake assets:precompile"
    end

    task :clean do
      run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec rake assets:clean"
    end
  end

  namespace :bundler do
    task :bundle_new_release  do
      run "cd #{current_path} && bundle install --deployment --quiet --without development test cucumber"
    end
  end

  after :finishing, 'deploy:cleanup'
end
