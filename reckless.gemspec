require File.expand_path("../lib/reckless/version", __FILE__)

Gem::Specification.new do |spec|
  spec.name        = "reckless"
  spec.version     = Reckless::VERSION
  spec.summary     = "Client for Reckless.com site"
  spec.description = "Client for Reckless.com site"
  spec.homepage    = "http://github.com/sosedoff/reckless"
  spec.authors     = ["Dan Sosedoff"]
  spec.email       = ["dan.sosedoff@gmail.com"]

  spec.add_dependency "json",     "~> 1.8"
  spec.add_dependency "faraday",  "~> 0.7"
  spec.add_dependency "nokogiri", "~> 1.5"
  
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec",     "~> 2.13"
  spec.add_development_dependency "simplecov", "~> 0.7"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  spec.require_paths = ["lib"]
end