require "bundler/gem_tasks"
require 'cucumber'

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

task :default => [:spec, :features]
