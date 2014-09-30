require 'spec_helper'

shared_examples "it returns the configured P3P header" do |http_verb|
  let(:header) { P3P::Configuration::DEFAULT_HEADER }

  it "should return P3P headers in a the case of a #{http_verb} request" do
    headers  = { 'Content-Type' => 'text/html' }
    app      = lambda { |env| [200, headers, []] }
    request  = Rack::MockRequest.env_for('/', lint: true, fatal: true, method: http_verb)
    response = P3P::Middleware.new(app).call(request)

    expect(response[1]).to include("P3P" => header)
  end
end

describe P3P do
  describe "#configure" do
    let(:header) { "This is not a real p3p header. Check out our privacy policy at example.com/privacy" }

    before do
      P3P.configure do |config|
        config.header = header
      end
    end

    it_should_behave_like "it returns the configured P3P header", "GET"
    it_should_behave_like "it returns the configured P3P header", "POST"
    it_should_behave_like "it returns the configured P3P header", "PUT"
    it_should_behave_like "it returns the configured P3P header", "DELETE"
    it_should_behave_like "it returns the configured P3P header", "HEAD"
    it_should_behave_like "it returns the configured P3P header", "OPTIONS"
    it_should_behave_like "it returns the configured P3P header", "TRACE"
    it_should_behave_like "it returns the configured P3P header", "CONNECT"

  end
end
