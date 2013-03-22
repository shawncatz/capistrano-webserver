# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/webserver/version'

Gem::Specification.new do |gem|
  gem.name          = "capistrano-webserver"
  gem.version       = Capistrano::Webserver::VERSION
  gem.authors       = ["Shawn Catanzarite"]
  gem.email         = ["me@shawncatz.com"]
  gem.description   = %q{Common way to manage webserver (apache) configuration using capistrano}
  gem.summary       = %q{Common way to manage webserver (apache) configuration using capistrano}
  gem.homepage      = "http://github.com/shawncatz/capistrano-webserver"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "capistrano", "~> 2.13.0"
end
