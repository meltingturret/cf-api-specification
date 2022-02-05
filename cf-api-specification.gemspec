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
  spec.add_development_dependency "bundler", "~> 2.3"
  spec.add_development_dependency "rake"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata = {
    "bug_tracker_uri" => "#{spec.homepage}/issues",
    "changelog_uri" => "#{spec.homepage}/blob/main/CHANGELOG.md",
    "documentation_uri" => spec.homepage.to_s,
    "homepage_uri" => spec.homepage.to_s,
    "source_code_uri" => spec.homepage.to_s
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.platform = Gem::Platform.local
  spec.post_install_message = "Thanks for installing!"
end
