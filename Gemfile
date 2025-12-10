# frozen_string_literal: true

source "https://rubygems.org"

gemspec

gem "irb"

# overwrite gemspec dependencies for CI
unless ENV['RACK_VERSION'].nil?
  gem 'rack', "~> #{ENV['RACK_VERSION']}"
end
