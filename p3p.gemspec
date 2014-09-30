# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'p3p/version'

Gem::Specification.new do |gem|
  gem.name          = "p3p"
  gem.version       = P3P::VERSION
  gem.authors       = ["Tom Milewski"]
  gem.email         = ["tmilewski@gmail.com"]
  gem.description   = %q{Inserts P3P header}
  gem.summary       = %q{Inserts P3P headers to allow cookies to be utilized in iframe scenarios with IE.}
  gem.homepage      = "https://github.com/tmilewski/p3p"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "rack"
  gem.add_development_dependency "rspec", "~> 3.1.0"
end
