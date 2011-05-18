Capistrano::Configuration.instance(true).load do

  ## common variables
  set :webserver_link,    true
  set :webserver_config,  "config/webserver/webserver.conf"
  set :webserver_restart, true

  ## apache specific variables
  set :webserver_init,    "/etc/init.d/apache2"
  set :webserver_dir,     "/etc/apache2/sites-enabled"

  after "deploy:setup", "webserver:setup"

  namespace :webserver do
    desc <<-DESC
      setup webserver directories.

      creates a directory under the shared resources directory for webserver
      related files
    DESC
    task :setup, :roles => :web do
      run "mkdir -p #{shared_path}/webserver"
    end

    desc <<-DESC
    update configuration.

    Upload the webserver configuration file to the shared resources directory
    and create a link (or copy to) the webserver configuration directory

    This task is designed to push the file directly, rather than use the deployed
    application directory. This means you will not need to do a deploy just to
    update configuration files for the webserver.
    DESC
    task :configuration, :roles => :web do
      # upload the file
      upload "#{webserver_config}", "#{shared_path}/webserver/#{application}"
      
      # remove the old file / link
      run "sudo rm -f #{webserver_dir}/#{application}"
      
      # link or copy file from shared to webserver directory
      if webserver_link == true
        run "sudo ln -sf #{shared_path}/webserver/#{application} #{webserver_dir}/#{application}"
      else
        run "sudo cp #{shared_path}/webserver/#{application} #{webserver_dir}/#{application}"
      end

      # restart the webserver
      if webserver_restart == true
        webserver.restart
      end
    end

    desc "start webserver (apache)"
    task :start, :roles => :web do
      run "sudo #{webserver_init} start"
    end

    desc "stop webserver (apache)"
    task :stop, :roles => :web do
      run "sudo #{webserver_init} stop"
    end

    desc "restart webserver (apache)"
    task :restart, :roles => :web do
      run "sudo #{webserver_init} restart"
    end

  end
end
