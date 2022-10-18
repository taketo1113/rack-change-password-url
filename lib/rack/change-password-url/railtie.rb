# frozen_string_literal: true

module Rack
  module ChangePasswordUrl
    class Railtie < ::Rails::Railtie
      initializer "rack-change-password-url.middleware" do |app|
        app.middleware.use Rack::ChangePasswordUrl::Middleware
      end
    end
  end
end
