# frozen_string_literal: true

require_relative "lib/callable/version"

Gem::Specification.new do |spec|
  spec.name          = "callable"
  spec.version       = Callable::VERSION
  spec.authors       = ["Michael Crowther"]
  spec.email         = ["crow404@gmail.com"]

  spec.summary       = "Lightweight .call mix-in for service objects"
  spec.description   = "Callable provides Ruby classes with a convenient `.call` method, "\
                       "simplifying instantiation and method invocation."
  spec.homepage      = "https://github.com/dbongo/callable"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.0.0"

  spec.metadata = {
    "homepage_uri"    => spec.homepage,
    "source_code_uri" => spec.homepage,
    "changelog_uri"   => "#{spec.homepage}/blob/main/CHANGELOG.md"
  }

  spec.files         = Dir["lib/**/*.rb", "LICENSE", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
