# frozen_string_literal: true

module Rack
  module ChangePasswordUrl
    class Middleware
      def initialize(app, options={})
        @app = app

        @redirect_path = options[:redirect_path]
      end

      def call(env)
        req = Rack::Request.new(env)

        if req.path == '/.well-known/change-password'
          unless @redirect_path.nil?
            return [ 302, { 'Location' => @redirect_path }, [] ]
          else
            raise Error.new('Failed to redirect change password url: not set redirect_path')
          end
        end

        @app.call(env)
      end
    end
  end
end
