source 'https://rubygems.org'

gem "twitter-bootstrap-rails"
gem 'simple_form'
gem 'country_select'
# gem 'cantango'
# gem 'cantango_editor'

gem 'rails', '~> 3.1.0'
gem 'pg', '0.11.0'
gem 'unicorn'
gem 'json'
gem 'devise'
gem 'sqlite3'

# dev branch core_models should always point to HEAD, staging+production core_models should always point to the 'dma_production' branch
# gem 'core_models', :git=>'git@github.com:rpx/core_models.git', :tag=>'v0.0.114'
# gem 'core_models', :path=>'../core_models'
gem "date_validator", "~> 0.6.2"
gem 'foreman'

gem 'will_paginate'
gem 'rack-contrib' 
gem 'jquery-rails'

group :development, :test, :qa do
  gem 'capybara'
  gem "capistrano"
  gem 'rspec-rails', " ~>2.7.0"
  gem 'test_track'
  gem 'factory_girl_rails'
  gem 'awesome_print'
  gem 'faker'
  gem 'pry'
  gem 'system_timer', :platforms => :ruby_18
  # gem 'newrelic_rpm'
  gem "rspec_junit_formatter"
  gem "shoulda-matchers"
  # gem 'watchr'
  # gem 'spork', '~> 0.9.0.rc'
  # gem 'database_cleaner'
  # gem 'launchy'
  # gem 'turn', :require => false
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby
  gem 'haml'
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
  gem 'bootstrap-sass'
end

