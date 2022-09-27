source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'mailjet'
gem 'aws-sdk-s3'
gem 'image_processing', '~> 1.0'
gem 'devise'
gem 'devise-i18n'
gem 'omniauth'
gem 'omniauth-github', github: 'omniauth/omniauth-github', branch: 'master'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'
gem 'rails-i18n'
gem 'rails', '~> 6.1.6', '>= 6.1.6.1'
gem 'resque'
gem 'puma', '~> 5.0'
gem 'pundit'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'net-smtp', require: false
gem 'net-imap', require: false
gem 'net-pop', require: false
gem 'webpacker', '~> 5.0'

group :development do
  gem 'capistrano', '3.17.1'
  gem 'capistrano-rails'
  gem 'capistrano-passenger'
  gem 'capistrano-rbenv'
  gem 'capistrano-resque', require: false
  gem 'capistrano-bundler'
  gem 'ed25519', '>= 1.2', '< 2.0'
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'
  gem 'letter_opener'
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'sqlite3', '~> 1.4'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'listen', '~> 3.3'
end

group :production do
  gem 'pg'
end
