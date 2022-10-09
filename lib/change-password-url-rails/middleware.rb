# frozen_string_literal: true

module ChangePasswordUrlRails
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      req = Rack::Request.new(env)

      if req.path == '/.well-known/change-password'
        return [ 302, { 'Location' => "http://example.com/xxx" }, [] ]
      end

      @app.call(env)
    end
  end
end
