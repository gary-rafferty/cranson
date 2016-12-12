# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cranson/version'

Gem::Specification.new do |spec|
  spec.name          = "cranson"
  spec.version       = Cranson::VERSION
  spec.authors       = ["Gary Rafferty"]
  spec.email         = ["gary.rafferty@gmail.com"]

  spec.summary       = %q{Cranson - SAX parser for Fingal planning applications}
  spec.description   = %q{Cranson - SAX parser for Fingal planning applications}
  spec.homepage      = "TODO: Add Github link"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10.3"

  spec.add_dependency "nokogiri", "~> 1.6.8"
end
