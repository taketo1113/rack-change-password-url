shared_context 'mock app' do
  let(:mock_app) { double 'Example Rack App' }

  before(:each) do
    allow(mock_app).to receive(:call).and_return([200, {}, "Example App Body"])
  end
end
