# frozen_string_literal: true

require_relative "lib/devise_crowdsec/version"

Gem::Specification.new do |spec|
  spec.name = "devise_crowdsec"
  spec.version = DeviseCrowdsec::VERSION
  spec.authors = ["CBL"]
  spec.email = ["cyril@dilolabs.fr"]

  spec.summary = "Devise CrowdSec extension"
  spec.description = "A Devise extension that sends alerts to CrowdSec when a configurable number of authentication failures occur. This gem helps you integrate CrowdSec with your Ruby on Rails application using the Devise authentication library, providing additional security and monitoring of failed login attempts."
  spec.homepage = "https://github.com/dilolabs/devise_crowdsec"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "devise", ">= 4.0"
  spec.add_dependency "faraday", ">= 1.0"
end
