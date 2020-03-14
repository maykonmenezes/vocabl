source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'pg'
gem 'haml-rails', '~> 2.0'
gem 'puma', '~> 4.1' # Use Puma as the app server
gem 'bootstrap', '~> 4.4.1'
gem 'jquery-rails'
gem 'devise'
gem 'language_list', '~> 1.2.1'
gem 'sass-rails', '>= 6' # Use SCSS for stylesheets
gem 'webpacker', '~> 4.0' # Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'turbolinks', '~> 5' # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'jbuilder', '~> 2.7' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'bootsnap', '>= 1.4.2', require: false # Reduces boot times through caching; required in config/boot.rb
gem 'simple_form'

group :development, :test do
  gem 'rspec-rails', '~> 4.0.0.beta'
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0' # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring' # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15' # Adds support for Capybara system testing and selenium driver
  gem 'selenium-webdriver'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'webdrivers' # Easy installation and use of web drivers to run system tests with browsers
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
