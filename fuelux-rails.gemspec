$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fuelux-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fuelux-rails"
  s.version     = FueluxRails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Stephen Baldwin"]
  s.email       = ["stephenbaldwin@me.com"]
  s.homepage    = "http://www.github.com/stephenbaldwin/fuelux-rails"
  s.summary     = "Fuel UX for Rails 3.1 Asset Pipeline"
  s.description = "fuelux-rails project integrates Fuel UX Bootstrap extensions for Rails 3.1 Asset Pipeline"

  s.rubyforge_project = 'fuelux-rails'

  #s.files = Dir["{app,config,db,lib,vendor}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.files = Dir["lib/**/*"] + Dir["vendor/**/*"] + ["Rakefile", "README.md", "COPYING", "THIRD-PARTY"]

  s.test_files = Dir["test/**/*"]
  s.require_paths = ["lib"]

  s.add_dependency             'railties',   '>= 3.1'
  s.add_dependency             'actionpack', '>= 3.1'
  s.add_dependency             'less-rails'
  s.add_runtime_dependency 'execjs'
	s.add_runtime_dependency 'rails', '>= 3.1'
  s.add_runtime_dependency "twitter-bootstrap-rails"
	s.add_development_dependency 'rake'
  #s.add_dependency "twitter-bootstrap-rails", "~> 2.2.0"
  #s.add_dependency "rails", ">= 3.1"
  s.post_install_message = "Important: You may need to add a javascript runtime to your Gemfile in order for bootstrap's LESS files to compile to CSS. \n\n" \
    "**********************************************\n\n" \
    "ExecJS supports these runtimes:\n\n" \
    "therubyracer - Google V8 embedded within Ruby\n\n" \
    "therubyrhino - Mozilla Rhino embedded within JRuby\n\n" \
    "Node.js\n\n" \
    "Apple JavaScriptCore - Included with Mac OS X\n\n" \
    "Microsoft Windows Script Host (JScript)\n\n" \
    "**********************************************"

end
