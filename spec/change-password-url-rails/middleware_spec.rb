# frozen_string_literal: true

require "rack/test"

RSpec.describe ChangePasswordUrlRails::Middleware do
  include Rack::Test::Methods
  include_context 'mock app'

  let(:app) { described_class.new(mock_app) }

  context "path: /.well-known/change-password" do
    before(:each) do
      @path = '/.well-known/change-password'
    end

    it "redirect to change password url" do
      get @path

      expect(last_response.status).to eq 302
      expect(last_response.headers).to eq({ "Location" => "http://example.com/xxx" })
      expect(last_response.body).to eq ''
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
