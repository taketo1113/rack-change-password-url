# frozen_string_literal: true

require "rack/test"

RSpec.describe Rack::ChangePasswordUrl::Middleware do
  include Rack::Test::Methods
  include_context 'mock app'

  let(:redirect_path) { nil }
  let(:app) { described_class.new(mock_app) }

  before(:each) do
    Rack::ChangePasswordUrl.configure do |config|
      config.redirect_path = redirect_path
    end
  end

  context "path: /.well-known/change-password" do
    before(:each) do
      @path = '/.well-known/change-password'
    end

    context "set redirect path" do
      let(:redirect_path) { 'http://example.com/xxx' }

      it "redirect to change password url" do
        get @path

        expect(last_response.status).to eq 302
        expect(last_response['location']).to eq "http://example.com/xxx"
        expect(last_response.body).to eq ''
      end
    end

    context "not set redirect path" do
      it "raise error: not set redirect path" do
        expect {
          get @path
        }.to raise_error(Rack::ChangePasswordUrl::Error)
      end
    end
  end

  context "path: /test" do
    before(:each) do
      @path = '/test'
    end

    it "get response with app" do
      get @path

      expect(last_response.status).to eq 200
      if Gem::Version.new(Rack.release) >= Gem::Version.new("3.1.0")
        expect(last_response.headers).to eq({ "content-length" => "16" })
      else
        expect(last_response.headers).to eq({})
      end
      expect(last_response.body).to eq 'Example App Body'
    end
  end
end
