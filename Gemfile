source 'https://rubygems.org'

gem 'rails', '3.2.14'
#gem 'rails', '4.0.0'
gem "mysql2"
gem 'exception_notification' ,'3.0.1'

#gem 'bcrypt-ruby', '~> 3.0.0'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'devise'

gem 'mini_magick'
gem "paperclip", "~> 3.0"
#gem 'carrierwave'
gem 'kaminari'

gem 'bootstrap-sass', '2.1'
gem 'haml-rails'
gem 'bourbon'
gem 'russian', '~> 0.6.0'
gem "select2-rails"
gem "execjs"
gem "therubyracer"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  # Use SCSS for stylesheets
  gem 'sass-rails' #, '~> 4.0.0'
                   # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier', '>= 1.3.0'
                   # Use CoffeeScript for .js.coffee assets and views
  gem 'coffee-rails' #, '~> 4.0.0'
end

group :development, :test do
  # `rspec-rails` needs to be in the development group so that Rails generators work.
  gem 'rspec-rails'
  gem 'annotate', '2.5.0'
  gem 'factory_girl_rails', '4.1.0'
  gem 'faker', '1.0.1'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'fakeweb', :require => false
  gem 'webmock'
  gem 'vcr'
  gem 'simplecov-rcov'
  gem 'database_cleaner'

  gem 'shoulda-matchers'
end

group :development do
  # Deploy with Capistrano
  gem 'capistrano', '~> 3.0', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-ext'
  # To use debugger
  gem 'debugger'
end

gem 'jquery-rails', '2.2.1'
gem "jquery-ui-rails", "~> 4.0.3"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

