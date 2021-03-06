

set :application, "Yue-Site"
set :stage, :production
set :pty, true


set :user, 'root'

role :app, %w{root@115.28.188.236}
role :web, %w{root@115.28.188.236}
role :db,  %w{root@115.28.188.236}

set :deploy_to, "/alidata1/www/#{fetch(:application)}"




# rvm 
set :rvm_ruby_version, 'ruby-2.1.0'
set :rvm_type, :user                     # Defaults to: :auto
set :rvm_custom_path, '/usr/local/rvm/'  # only needed if not detected




set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public }



set :unicorn_service, "unicorn_#{fetch(:application)}_#{fetch(:stage)}"
set :unicorn_pid, "#{fetch(:deploy_to)}/current/tmp/pids/unicorn.pid"
set :unicorn_config, "#{fetch(:deploy_to)}/current/config/unicorn.rb"
set :unicorn_workers, 1



puts "#{fetch(:unicorn_config)}"


server 'root@115.28.188.236', roles: [:web, :app] 

set :rails_env, :production
set :unicorn_env, :production



set :nginx_use_ssl, true
set :nginx_ssl_certificate_local_path, "/etc/ssl/certs/yuenvshen.com.crt"
set :nginx_ssl_certificate_key_local_path, "/etc/ssl/private/yuenvshen.com.key"

set :nginx_config_path, "/etc/nginx/sites-available/"
# set :nginx_server_name, '115.28.188.236'
set :nginx_server_name, 'yuenvshen.com'
set :nginx_pid, "/var/run/nginx.pid"












