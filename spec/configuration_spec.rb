require 'spec_helper'

shared_examples 'it returns configured P3P header' do |header, http_verb|
  it "should return custom P3P headers in the case of a #{http_verb} request" do
    headers  = {'Content-Type' => 'text/html'}
    app      = lambda { |_env| [200, headers, []] }
    request  = Rack::MockRequest.env_for('/', :lint => true, :fatal => true, :method => http_verb)
    response = P3P::Middleware.new(app).call(request)

    expect(response[1]).to include('P3P' => header)
  end
end

describe P3P do
  describe '#configure' do
    let(:header) { 'Fake p3p header' }

    before do
      P3P.configure do |config|
        config.header = @header
      end
    end

    it_should_behave_like 'it returns configured P3P header', @header, 'GET'
    it_should_behave_like 'it returns configured P3P header', @header, 'POST'
    it_should_behave_like 'it returns configured P3P header', @header, 'PUT'
    it_should_behave_like 'it returns configured P3P header', @header, 'DELETE'
    it_should_behave_like 'it returns configured P3P header', @header, 'HEAD'
    it_should_behave_like 'it returns configured P3P header', @header, 'OPTIONS'
    it_should_behave_like 'it returns configured P3P header', @header, 'TRACE'
    it_should_behave_like 'it returns configured P3P header', @header, 'CONNECT'
  end
end
