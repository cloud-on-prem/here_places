# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'here_places/version'

Gem::Specification.new do |gem|
  gem.name          = "here_places"
  gem.version       = HerePlaces::VERSION 
  gem.authors       = ["Prem Pillai"]
  gem.email         = ["prem.pillai@gmail.com"]
  gem.description   = %q{A wafer-thin Ruby Wrapper for Nokia's Here Places API}
  gem.summary       = %q{A wafer-thin Ruby Wrapper for Nokia's Here Places API}
  gem.homepage      = "https://github.com/premjg/here_places"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features|helper)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency 'rspec', '~>2.1'
  gem.add_development_dependency 'fakeweb', '~>1.3'
  gem.add_dependency 'faraday', '~>0.8.4'
end