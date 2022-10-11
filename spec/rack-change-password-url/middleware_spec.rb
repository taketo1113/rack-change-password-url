# frozen_string_literal: true

require "rack/test"

RSpec.describe Rack::ChangePasswordUrl::Middleware do
  include Rack::Test::Methods
  include_context 'mock app'

  let(:redirect_path) { nil }
  let(:app) { described_class.new(mock_app, redirect_path: redirect_path) }

  context "path: /.well-known/change-password" do
    before(:each) do
      @path = '/.well-known/change-password'
    end

    context "set redirect path" do
      let(:redirect_path) { 'http://example.com/xxx' }

      it "redirect to change password url" do
        get @path

        expect(last_response.status).to eq 302
        expect(last_response.headers).to eq({ "Location" => "http://example.com/xxx" })
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
      expect(last_response.headers).to eq({})
      expect(last_response.body).to eq 'Example App Body'
    end
  end
end
