require 'rack'
require 'p3p'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  config.order = :random

  config.after(:each) do
    P3P.configuration.set_default_header!
  end
end
