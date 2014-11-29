require 'spec_helper'

shared_examples 'it returns P3P headers' do |http_verb|
  it "should return default P3P headers in the case of a #{http_verb} request" do
    p3p_header = Time.now.to_i
    headers    = {'Content-Type' => 'text/html'}
    app        = lambda { |_env| [200, headers, []] }
    request    = Rack::MockRequest.env_for('/', :lint => true, :fatal => true, :method => http_verb)

    P3P.configure { |c| c.header = p3p_header }

    response = P3P::Middleware.new(app).call(request)

    expect(response[1]).to include('P3P' => p3p_header)
  end
 end

describe P3P::Middleware do
  after do
    P3P.configuration.set_default_header!
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
