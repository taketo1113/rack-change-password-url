class App
  def call(env)
    [200, { "Content-Type" => "text/plain" }, ["HELLO WORLD!", "Hello"]]
  end
end

require "rack"
require "rack/change-password-url"

app = Rack::Builder.new do
  Rack::ChangePasswordUrl.configure do |config|
    config.redirect_path = '/your-redirect-path'
  end

  use Rack::ChangePasswordUrl::Middleware
  run App.new
end

require "rack/handler/puma"
Rack::Handler::Puma.run app
