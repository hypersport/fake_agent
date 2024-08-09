# frozen_string_literal: true

require_relative "lib/version"

Gem::Specification.new do |spec|
  spec.name = "fake_agent"
  spec.version = FakeAgent::VERSION
  spec.authors = ["hypersport"]
  spec.email = ["boss.yuan@outlook.com"]

  spec.summary = "Fake User Agent"
  spec.description = "Up-to-date simple user agents of the top 5 browsers in the world."
  spec.homepage = "https://github.com/hypersport/fake_agent"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/hypersport/fake_agent"
  spec.metadata["changelog_uri"] = "https://github.com/hypersport/fake_agent/blob/main/CHANGELOG.md"
  spec.metadata['bug_tracker_uri'] = 'https://github.com/hypersport/fake_agent/issues'
  spec.metadata['documentation_uri'] = 'https://rubydoc.info/github/hypersport/fake_agent'
  spec.metadata['yard.run'] = 'yri'
  spec.metadata["rubygems_mfa_required"] = "true"
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = %w[lib/fake_agent.rb lib/version.rb lib/browsers.json]
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
