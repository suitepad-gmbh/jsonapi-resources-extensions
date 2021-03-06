# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jsonapi/extensions/version'

Gem::Specification.new do |spec|
  spec.name          = "jsonapi-resources-extensions"
  spec.version       = JSONAPI::Extensions::VERSION
  spec.authors       = ["Moritz Lawitschka"]
  spec.email         = ["moritz.lawitschka@suitepad.de"]

  spec.summary       = 'JSONAPI::Resources extension for errors and Pundit'
  spec.description   = 'JSONAPI::Resources extension for errors and Pundit'
  spec.homepage      = "https://github.com/suitepad-gmbh/jsonapi-resources-extensions"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.pkg.github.com/suitepad-gmbh"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
