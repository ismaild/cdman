source 'https://rubygems.org'

ruby '2.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'

# Servers
gem 'thin'
gem 'unicorn'

# Data
gem 'mongoid'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'httpclient', '~> 2.6.0.1'
gem "algoliasearch-rails"

# assets
gem 'bootstrap-sass', '~> 2.3.2.2'
gem 'jquery-rails'
gem 'hogan_assets'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'mongoid-slug'
gem 'resque', require: 'resque/server'

gem 'lastfm'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'factory_girl_rails'

  gem 'rspec-rails', '~> 3.0'
end

group :test do
  gem 'mongoid-tree' # NOTE: DatabaseCleaner/database_cleaner issue #299
  gem 'database_cleaner'
  gem 'mongoid-rspec'
end

group :production do
  gem 'rails_12factor' # Only for heroku
end