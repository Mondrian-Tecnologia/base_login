source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# HAML views. Read more: https://github.com/haml/haml
gem 'haml', '~> 5.2.1'
# Users:: Read more: https://github.com/plataformatec/devise
gem 'devise', '~> 4.7.2'
gem 'devise-encryptable'
# A pure ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.
# Read more: https://github.com/jwt/ruby-jwt
gem 'jwt'
# Use Devise to api auth. Read more: https://github.com/lynndylanhurley/devise_token_auth
# gem 'devise_token_auth', '~> 1.1.2'
# UserAccess:: Read more: https://github.com/varvet/pundit
gem 'pundit', '~> 2.1.0'
# Use ActiveStorage variant
gem 'mini_magick', '~> 4.11.0'
# Methods pt-BR. Read more: https://github.com/tapajos/brazilian-rails
gem 'brazilian-rails', '~> 3.3.0'
# Paginate objects. Read more: https://github.com/kaminari/kaminari
gem 'kaminari'
# https://github.com/activerecord-hackery/ransack
gem 'ransack'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 5.0.0'
# SPROCKETS
gem 'sprockets', '~> 4'
gem 'sprockets-rails', require: 'sprockets/railtie'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.10.1'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'mime-types', '~> 3.3.1', require: false
# MiniRacer
gem 'mini_racer'
# Dalli
gem 'dalli'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.2.5'
gem 'resque'
gem 'sidekiq', '6.1.2'
# Service worker. Read more: https://github.com/rossta/serviceworker-rails
gem 'serviceworker-rails'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Active Storage variant
gem 'image_processing', '~> 1.2'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.5.1', require: false
# Whenever CronJobs. Read more: https://github.com/javan/whenever
gem 'whenever' #, require: false
# NewRelic Report
gem 'newrelic_rpm'
## GEMS DO DUTE + PI
gem 'ruby_certisign_login', '~> 0.1.25'
# Print Boletos; Read more: https://github.com/mondriantecnologia/brcobranca
# gem 'brcobranca', github: 'kivanio/brcobranca', branch: '8503d474b98f793244a620cb12fb30010398f072'
# gem 'brcobranca'
# Validate Dates Model. Read more: https://github.com/adzap/validates_timeliness/
gem 'validates_timeliness', '~> 4.1.1'
# Versioned Objects. Read more:  https://github.com/jmckible/version_fu
gem 'version_fu'
# Update Browser. Read more: https://github.com/fnando/browser
gem 'browser', '~> 5.1.0'
# gem 'wash_out', '~> 0.12.0' # old soap
# PDF
gem 'wicked_pdf', '~> 2.1.0'
gem 'wkhtmltopdf-binary', '~> 0.12.6.5'
# SOAP
# gem 'savon', '2.12.1'
# Dynamic nested forms using jQuery made easy; works with formtastic, simple_form or default forms
# https://github.com/nathanvda/cocoon
gem 'cocoon'
# WebPushNotifications = OneSignal
# gem 'onesignal-ruby-rails6'
gem 'httparty'
# Use RackCors to access-filter. Read more: https://github.com/cyu/rack-cors
gem 'rack-cors', require: 'rack/cors'
# UseRackAttack to rails-fw. Read more: https://github.com/kickstarter/rack-attack
gem 'rack-attack'
# A fast JSON:API serializer
# gem 'jsonapi-serializer'
# gem 'jsonapi.rb'

group :assets do
  gem 'uglifier', '>= 4.2.0'
end

gem 'bootstrap', '~> 4.5.3'
gem 'data-confirm-modal'
gem 'font-awesome-sass', '~> 5.15.1'
gem 'jquery-rails', '~> 4.4.0'
gem 'sassc-rails', '>= 2.1.2'
# Client Side Validations made easy for Ruby on Rails
gem 'client_side_validations'
# https://github.com/jamesmartin/inline_svg
gem 'inline_svg'
# Printer Objects
gem 'awesome_print'
group :development, :staging do
  gem 'listen', '~> 3.3.3'
  # Debug
  gem 'pry', '~> 0.13.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  gem 'byebug'
  # Better Errors
  gem 'better_errors'
  gem 'binding_of_caller'
  # gem 'bullet' ainda nao disponivel para rails 6.1.0
  # rubocop
  gem 'rubocop', '~> 1.6.1', require: false
  # Add a comment summarizing the current schema to the top or bottom
  gem 'annotate', '~> 3.1.1'
end

group :test do
  # Spring speeds up development by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.1'
  # RSpec for Rails 5+ - https://github.com/rspec/rspec-rails
  gem 'rspec-rails', '~> 4.0.1'
  gem 'rspec-sidekiq'
  # chromedriver-helper
  gem 'chromedriver-helper', '~> 2.1.1'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  # A library for generating fake data such as names, addresses, and phone numbers.
  # https://github.com/faker-ruby/faker
  gem 'faker', '~> 2.15.1'
  # Factory Bot hearts Rails - https://github.com/thoughtbot/factory_bot_rails
  gem 'factory_bot_rails', '~> 6.1.0'
  # Simple one-liner tests for common Rails functionality - https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers', '~> 4.4.1'
  # database_cleaner
  gem 'database_cleaner-active_record', '~> 1.8.0'
  # simplecov
  gem 'simplecov', require: false
  # Read More: https://github.com/rails/rails-controller-testing
  gem 'rails-controller-testing'
  # A set of RSpec matchers for testing Pundit authorisation policies - https://github.com/chrisalley/pundit-matchers
  gem 'pundit-matchers', '~> 1.6.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
