Capistrano::Configuration.instance(true).load do
  ## common variables
  set :webserver_link,    true
  set :webserver_config,  "#{current_dir}/config/webserver/webserver.conf"
  set :webserver_restart, true

  ## apache specific variables
  set :webserver_init,    "/etc/init.d/apache2"
  set :webserver_dir,     "/etc/apache2/sites-enabled"
  set :webserver_dest,    "#{webserver_dir}/#{application}"

  namespace :webserver do
    desc "update configuration"
    task :configuration, :roles => :web do
      if webserver_link == true
        run "rm -rf #{webserver_dest} ; #{try_sudo} ln -s #{webserver_config} #{webserver_dest}"
      else
        run "rm -rf #{webserver_dest} ; #{try_sudo} cp #{webserver_config} #{webserver_dest}"
      end
    end

    desc "start webserver (apache)"
    task :start, :roles => :web do
      run "#{try_sudo} #{webserver_init} start"
    end

    desc "stop webserver (apache)"
    task :stop, :roles => :web do
      run "#{try_sudo} #{webserver_init} stop"
    end

    desc "restart webserver (apache)"
    task :restart, :roles => :web do
      run "#{try_sudo} #{webserver_init} restart"
    end

  end
end