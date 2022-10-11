# frozen_string_literal: true

require_relative "change-password-url/middleware"
require_relative "change-password-url/version"

require_relative 'change-password-url/railtie' if defined?(::Rails)

module Rack
  module ChangePasswordUrl
    class Error < StandardError; end
  end
end
