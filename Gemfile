source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 6.1.4'

# Assets
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'

# UI/UX
gem 'jbuilder', '~> 2.7'
gem 'turbolinks', '~> 5'

# Application server
gem 'puma', '~> 5.0'

# Database
gem 'pg', '~> 1.1'

# Responsive design
gem 'jpmobile', '6.1.1'

# Configuration
gem 'dotenv-rails'

# API
gem 'google-cloud-vision'

# Pagination
gem 'pagy'

# Static pages
gem 'high_voltage'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Debugger
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # Code analyze
  gem 'rubocop'
  gem 'rubocop-rails'
end

group :development do
  # CLI
  gem 'spring'

  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'web-console', '>= 4.1.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
