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

  s.files = Dir["{app,config,db,lib,vendor}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'less-rails', '~> 2.2.3'
  s.add_development_dependency "twitter-bootstrap-rails", "~> 2.1.3"
  s.add_development_dependency "rails", ">= 3.1"

end
