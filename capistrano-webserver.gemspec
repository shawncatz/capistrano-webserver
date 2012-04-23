# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name    = %q{capistrano-webserver}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors           = ["Shawn Catanzarite"]
  s.date              = %q{2011-05-17}
  s.description       = %q{Common way to manage webserver (apache) configuration using capistrano}
  s.email             = %q{scatanzarite@gmail.com}
  s.extra_rdoc_files  = ["README.rdoc", "lib/webserver/apache.rb"]
  s.files             = ["README.rdoc", "Rakefile", "capistrano-webserver.gemspec", "lib/webserver/apache.rb", "Manifest"]
  s.homepage          = %q{http://github.com/dashonet/capistrano-webserver}
  s.rdoc_options      = ["--line-numbers", "--inline-source", "--title", "Capistrano-webserver", "--main", "README.rdoc"]
  s.require_paths     = ["lib"]
  s.rubyforge_project = %q{capistrano-webserver}
  s.rubygems_version  = %q{1.6.2}
  s.summary           = %q{Common way to manage webserver configuration using capistrano. Only apache is currently supported.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<capistrano>, [">= 0"])
    else
      s.add_dependency(%q<capistrano>, [">= 0"])
    end
  else
    s.add_dependency(%q<capistrano>, [">= 0"])
  end
end
