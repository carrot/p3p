require 'rack'
require 'p3p'

RSpec.configure do |config|
  config.after(:each) do
    P3P.configuration.set_default_header!
  end
end
