require "spec_helper"

shared_examples "it returns P3P headers" do |http_verb|
  it "should return P3P headers in a the case of a #{http_verb} request" do
    headers  = { 'Content-Type' => 'text/html' }
    app      = lambda { |env| [200, headers, []] }
    request  = Rack::MockRequest.env_for('/', lint: true, fatal: true, method: http_verb)
    response = P3P::Middleware.new(app).call(request)

    expect(response[1]).to include("P3P"=> 'CP="NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"')
  end
end

describe P3P::Middleware do
  it_should_behave_like "it returns P3P headers", "GET"
  it_should_behave_like "it returns P3P headers", "POST"
  it_should_behave_like "it returns P3P headers", "PUT"
  it_should_behave_like "it returns P3P headers", "DELETE"
  it_should_behave_like "it returns P3P headers", "HEAD"
  it_should_behave_like "it returns P3P headers", "OPTIONS"
  it_should_behave_like "it returns P3P headers", "TRACE"
  it_should_behave_like "it returns P3P headers", "CONNECT"
end
