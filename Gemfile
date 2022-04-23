source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem "rails", "~> 7.0.2", ">= 7.0.2.3"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'bcrypt', '~> 3.1.12'
gem 'jwt'
gem 'rack-cors'
gem 'ransack'
gem 'simple_command'
gem 'simple_enum'
gem 'request_store'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem 'byebug'
end

