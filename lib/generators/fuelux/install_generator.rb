require 'rails/generators'

module Fuelux
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      desc "This generator installs Fuel UX to Asset Pipeline"

      def generate_install

        if File.exist?('app/assets/stylesheets/bootstrap_and_overrides.css.less')
          insert_into_file "app/assets/stylesheets/bootstrap_and_overrides.css.less", "@import 'fuelux.less';\n", :after => %(@import "fontawesome";\n)
        else
          puts <<-EOM
          Warning:
            app/assets/stylesheets/bootstrap_overrides.css.less does not exist
            Run "rails generate bootstrap:install" and then rerun "rails generate fuelux:install"
          EOM
        end

        if File.exist?('app/assets/javascripts/application.js')
          # Add our own require:
          content = File.read("app/assets/javascripts/application.js")
          if content.match(/require\s+fuelux\.js\s*$/)
            # Good enough - that'll include our Fuel UX js
          else
            insert_into_file "app/assets/javascripts/application.js", "//= require fuelux.js\n", :after => "jquery_ujs\n"
          end
        end

      end
    end
  end
end
