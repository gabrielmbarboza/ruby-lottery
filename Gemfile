# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.3.0"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'dry-cli', '~> 1.4.1'
gem 'mechanize', '~> 2.14.0'
gem 'connection_pool', '~> 2.4'
gem 'tty-spinner', '~> 0.9.3'

group :test do
  gem 'rspec', '~> 3.13'
  gem 'rspec-collection_matchers'
  gem 'webmock', '~> 3.24'
end
