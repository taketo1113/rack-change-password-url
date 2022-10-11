# frozen_string_literal: true

require_relative 'rails_options'

module ChangePasswordUrlRails
  class Railtie < ::Rails::Railtie
    config.change_password_url_rails = RailsOptions.new

    initializer "change-password-url-rails.middleware" do |app|
      app.middleware.use ChangePasswordUrlRails::Middleware, { redirect_path: app.config.change_password_url_rails.redirect_path }
    end
  end
end
