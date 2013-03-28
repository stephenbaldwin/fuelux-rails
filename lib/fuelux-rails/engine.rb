require 'rails'

module FueluxRails
  class Engine < ::Rails::Engine
    require 'less-rails'
    initializer 'fuelux-rails.setup',
      :after => 'less-rails.after.load_config_initializers',
      :group => :all do |app|
      app.config.less.paths << File.join(config.root, 'vendor', 'toolkit')
      end
  end
end
