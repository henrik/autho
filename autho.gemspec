# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'autho/version'

Gem::Specification.new do |spec|
  spec.name          = "autho"
  spec.version       = Autho::VERSION
  spec.authors       = ["Henrik Nyh"]
  spec.email         = ["henrik@nyh.se"]
  spec.summary       = %q{A many-stop shop for authentication.}
  spec.homepage      = "https://github.com/henrik/autho"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ["lib"]

  spec.add_dependency "attr_extras", ">=1.6.2"
  spec.add_dependency "bcrypt-ruby"

  spec.add_development_dependency "bundler", ">= 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
