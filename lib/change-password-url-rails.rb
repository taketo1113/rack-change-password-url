# frozen_string_literal: true

require_relative "change-password-url-rails/middleware"
require_relative "change-password-url-rails/version"

require 'change-password-url-rails/railtie' if defined?(::Rails)

module ChangePasswordUrlRails
  class Error < StandardError; end
end
