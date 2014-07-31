# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'thjalfi/version'

Gem::Specification.new do |spec|
  spec.name          = "thjalfi"
  spec.version       = Thjalfi::VERSION
  spec.authors       = ["arukoh"]
  spec.email         = ["arukoh10@gmail.com"]
  spec.summary       = %q{Thhjalfi is CLI gem generator with Thor.}
  spec.description   = %q{Thhjalfi is CLI gem generator with Thor.}
  spec.homepage      = "https://github.com/arukoh/thjalfi"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler"
  spec.add_dependency "thor"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
