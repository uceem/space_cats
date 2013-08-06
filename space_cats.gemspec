# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'space_cats/version'

Gem::Specification.new do |spec|
  spec.name          = "space_cats"
  spec.version       = SpaceCats::VERSION
  spec.authors       = ["John Otander"]
  spec.email         = ["john@uceem.com"]
  spec.description   = %q{Space. Cats. Gem.}
  spec.summary       = %q{Space. Cats. Gem.}
  spec.homepage      = "https://uceem.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "tumblr-rb"
end