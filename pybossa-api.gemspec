# -*- encoding: utf-8 -*-
require File.expand_path('../lib/pybossa-api/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "pybossa-api"
  s.version     = PyBossa::API::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Open North"]
  s.email       = ["info@opennorth.ca"]
  s.homepage    = "http://github.com/opennorth/pybossa-api-ruby"
  s.summary     = %q{The PyBossa API Ruby Gem}
  s.description = %q{A Ruby wrapper for the PyBossa API}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency('yajl-ruby', '~> 1.0')
  s.add_runtime_dependency('httparty', '~> 0.10.0')
  s.add_runtime_dependency('sanitize', '~> 2.0.2')
  s.add_development_dependency('rspec', '~> 2.10')
  s.add_development_dependency('rake')
  s.add_development_dependency('coveralls')
end
