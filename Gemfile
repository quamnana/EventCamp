source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.7'
gem 'dotenv-rails', groups: [:development, :test]

gem 'dotenv', '~> 2.7', '>= 2.7.6'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard', '~> 2.16', '>= 2.16.1'
  gem 'guard-livereload', '~> 2.5', '>= 2.5.2'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Gems used to develop the application
gem 'better_errors', '~> 2.5' #for displaying well defined errors in the browser
gem 'awesome_print', '~> 1.8' #for better dislpay of models in rails console 
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7' #for styling the application
gem 'jquery-rails'
gem 'simple_form', '~> 4.0', '>= 4.0.1' #for generating forms
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.4' #for generate icons 
gem 'pundit', '~> 2.0' #for authourization
gem 'devise', '~> 4.5' #for authentication
gem 'carrierwave', '~> 1.2', '>= 1.2.3' #for upload of images
gem 'friendly_id', '~> 5.2', '>= 5.2.4' #display more human friendly url inplace of standard ids 
gem 'fog', '~> 2.1'
gem 'mini_magick', '~> 4.9', '>= 4.9.2'
gem "cocoon" #for nested forms
gem 'rqrcode' #for generating qrcode for tickets
gem 'wicked_pdf' #for generating downloadable pdf format of pages
gem 'wkhtmltopdf-binary' #support for wicked_pdf
gem 'wkhtmltopdf-binary-edge' #support for wicked_pdf
gem 'bootstrap-email' #styling emails with boostrap
gem 'will_paginate' #to divide page content
gem 'bootstrap-will_paginate' #bootstrap styling for will_paginate
gem 'searchkick' #for implementing search functionality
gem 'stripe' #for implementing payment gateway for app


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
