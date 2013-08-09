# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flaun/version'

Gem::Specification.new do |spec|
  spec.name          = "flaun"
  spec.version       = Flaun::VERSION
  spec.authors       = ["Tomohiko Himura"]
  spec.email         = ["eiel.hal@gmail.com"]
  spec.description   = %q{launch browser after ssh local forward}
  spec.summary       = %q{launchBrowesr after ssh local forward}
  spec.homepage      = "https://github.com/eiel/flaun"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry-byebug"
  spec.add_dependency "launchy"
  spec.add_dependency "net-ssh"
end
