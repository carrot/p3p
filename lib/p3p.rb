require 'p3p/configuration'
require 'p3p/middleware'
require 'p3p/version'
require 'p3p/railtie' if defined?(Rails)

# Base module
module P3P
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
