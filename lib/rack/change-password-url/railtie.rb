# frozen_string_literal: true

require_relative 'rails_options'

module Rack
  module ChangePasswordUrl
    class Railtie < ::Rails::Railtie
      config.rack_change_password_url = RailsOptions.new

      initializer "rack-change-password-url.middleware" do |app|
        app.middleware.use Rack::ChangePasswordUrl::Middleware, { redirect_path: app.config.rack_change_password_url.redirect_path }
      end
    end
  end
end
