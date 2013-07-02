# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yoolk_styleguide/version'

Gem::Specification.new do |spec|
  spec.name          = "yoolk-styleguide"
  spec.version       = YoolkStyleguide::VERSION
  spec.authors       = ["vorleak", "chamnap"]
  spec.email         = ["vorleak.chy@gmail.com", "chamnapchhorn@gmail.com"]
  spec.description   = %q{A mountable Rails engine where you can view yoolk internal styleguide.}
  spec.summary       = %q{A style guide for your Rails application.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.13.0"

  spec.add_dependency "rails", "~> 3.2"
  spec.add_dependency "bootstrap-sass", "~> 2.3.2.0"
end
