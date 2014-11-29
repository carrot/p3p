if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
elsif ENV['CI']
  require 'coveralls'
  Coveralls.wear!
end

require 'rack'
require 'p3p'
