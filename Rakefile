require 'rubygems'  
require 'rake'  
require 'echoe'  
  
Echoe.new('capistrano-webserver', '0.1.1') do |p|  
  p.description     = "Common way to manage webserver configuration using capistrano"
  p.url             = "http://github.com/dashonet/capistrano-webserver"  
  p.author          = "Shawn Catanzarite"  
  p.email           = "shawn@dasho.net"
  p.ignore_pattern  = ["tmp/*", "script/*","nbproject/**","nbproject/private/*"]
  p.development_dependencies = ["capistrano"]  
end  
  
Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }  
