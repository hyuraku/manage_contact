source 'https://rubygems.org'
ruby '2.7.5'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '7.0.3.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '>= 5.6.2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'html2slim'
gem 'slim'
gem 'slim-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'rspec-rails', '>=4.0.2'
end

group :test do
  gem 'rails-controller-testing'
  gem 'rspec'
  gem 'rspec_junit_formatter'
end

gem 'faker'

gem 'bootstrap-sass', '>= 3.4.1'
gem 'jasny-bootstrap-rails', '~> 3.1', '>= 3.1.3'
gem 'jquery-rails'
gem 'mimemagic', '0.3.10'
gem 'paperclip', '~> 6.1'

group :development do
  # gem 'bullet'

  gem 'annotate'
  gem 'guard', '~> 2.14.0'
  gem 'guard-cucumber', '~> 2.1.2'
  gem 'guard-rspec', '~> 4.7.2'
  gem 'rubocop', '~> 1.30'
end

gem 'devise'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'loofah', '>= 2.2.3'
gem 'nokogiri', '>= 1.12.5'
gem 'pagy', '>= 3.10'
gem 'pundit'
gem 'rack', '>= 2.0.6'
gem 'rake', '>= 2.0.6', '< 13.0'
gem 'toastr-rails'
gem 'yard', '>= 0.9.20'

gem "zeitwerk", "~> 2.5"
