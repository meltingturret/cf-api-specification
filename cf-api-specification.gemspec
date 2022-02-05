# frozen_string_literal: true

require_relative "lib/cf/api/specification/version"

Gem::Specification.new do |spec|
  spec.name = "cf-api-specification"
  spec.version = Cf::Api::Specification::VERSION
  spec.authors = ["meltingturret"]
  spec.email = ["meltingturret@gmail.com"]

  spec.summary = "Ruby gem to generate and provide OpenAPI Specification for Cloud Foundry API."
  spec.description = "Ruby gem to generate and provide OpenAPI Specification for Cloud Foundry API."
  spec.homepage = "https://github.com/meltingturret/cf-api-specification"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata = {
    "bug_tracker_uri" => "#{spec.homepage}/issues",
    "changelog_uri" => "#{spec.homepage}/blob/main/CHANGELOG.md",
    "documentation_uri" => spec.homepage.to_s,
    "homepage_uri" => spec.homepage.to_s,
    "source_code_uri" => spec.homepage.to_s,
    "allowed_push_host" => "https://rubygems.org/"
  }

  spec.files = Dir.glob("{bin,lib}/**/*", File::FNM_DOTMATCH, base: __dir__)

  spec.executables = ["cfas"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "robocop"
  spec.add_development_dependency "yard"
end
