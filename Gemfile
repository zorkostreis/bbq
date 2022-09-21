source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'mailjet'
gem 'aws-sdk-s3'
gem 'image_processing', '~> 1.0'
gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n'
gem 'rails', '~> 6.1.6', '>= 6.1.6.1'
gem 'puma', '~> 5.0'
gem 'pundit'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'net-smtp', require: false
gem 'net-imap', require: false
gem 'net-pop', require: false

group :development do
  gem 'letter_opener'
  gem 'sqlite3', '~> 1.4'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'listen', '~> 3.3'
end

group :production do
  gem 'pg'
end
