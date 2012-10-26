# Fuel UX for Rails 3.1 Asset Pipeline
Extends Twitter Bootstrap with additional lightweight JavaScript controls. Easy to install, customize, update, and optimize. 

fuelux-rails project integrates Fuel UX into the Twitter Bootstrap CSS toolkit for Rails 3.1 Asset Pipeline (Rails 3.2 supported)

## Installing Gem

Include the [FuelUX Rails gem](http://rubygems.org/gems/fuelux-rails) in Gemfile to install it from [RubyGems.org](http://rubygems.org);

```ruby
gem "fuelux-rails"
```

or you can install from latest build;

```ruby
gem 'fuelux-rails', :git => 'git://github.com/stephenbaldwin/fuelux-rails.git'
```

You can run bundle from command line

    bundle install


## Installing to App (using Generators)

You can run following generators to get started with Twitter Bootstrap quickly.


Install (requires directives to Asset pipeline.)


Usage:

    rails g fuelux:install

## Using with Less

Fuel UX was built with Preboot, an open-source pack of mixins and variables to be used in conjunction with Less, a CSS preprocessor for faster and easier web development.

## Using stylesheets with Less

You have to require Fuel UX Rails LESS (fuelux.less) in your bootstrap_and_overrides.css.less

```css
@import 'fuelux.less';
```

## Using Javascripts

You have to require Fuel UX (fuelux.js) in your application.js

```js
//= require fuelux.js

$(document).ready(function(){
  /* Your javascripts goes here... */
});
```
