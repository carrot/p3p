require 'spec_helper'

shared_examples 'it returns P3P headers' do |http_verb|
  it "should return default P3P headers in the case of a #{http_verb} request" do
    headers  = {'Content-Type' => 'text/html'}
    app      = lambda { |_env| [200, headers, []] }
    request  = Rack::MockRequest.env_for('/', :lint => true, :fatal => true, :method => http_verb)
    response = P3P::Middleware.new(app).call(request)

    expect(response[1]).to include('P3P' => P3P::Configuration::DEFAULT_HEADER)
  end
end

describe P3P::Middleware do
  describe '.initialize' do
    it 'should set the default header' do
      expect_any_instance_of(P3P::Configuration).to receive(:set_default_header!)
      P3P.configure { |_config| }
    end
  end

  describe '.set_default_header!' do
    it 'should set the default header' do
      header = 'abc123'
      default_header = P3P::Configuration::DEFAULT_HEADER

      P3P.configure { |c| c.header = header }
      expect(P3P.configuration.header).to eq header

      P3P.configuration.set_default_header!
      expect(P3P.configuration.header).to eq default_header
    end
  end

  it_should_behave_like 'it returns P3P headers', 'GET'
  it_should_behave_like 'it returns P3P headers', 'POST'
  it_should_behave_like 'it returns P3P headers', 'PUT'
  it_should_behave_like 'it returns P3P headers', 'DELETE'
  it_should_behave_like 'it returns P3P headers', 'HEAD'
  it_should_behave_like 'it returns P3P headers', 'OPTIONS'
  it_should_behave_like 'it returns P3P headers', 'TRACE'
  it_should_behave_like 'it returns P3P headers', 'CONNECT'
end
