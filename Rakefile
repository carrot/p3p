require 'bundler/gem_tasks'

desc "Run RSpec with code coverage"
task :coverage do
  `COVERAGE=true rspec`
  `open coverage/index.html`
end
