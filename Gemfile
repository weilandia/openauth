# frozen
source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"
gem "dotenv-rails", require: "dotenv/rails-now"

gem "blueprinter"
gem "bootsnap", require: false
gem "image_processing", "~> 1.2"
gem "importmap-rails"
gem "kredis"
gem "pg", "~> 1.4"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "redis", "~> 4.0"
gem "sassc-rails"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"

group :development, :test do
  gem "foreman"
  gem "pry-byebug"
end

group :development do
  gem "rack-mini-profiler"
  gem "rubocop-daemon", require: false
  gem "rubocop-rails"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
