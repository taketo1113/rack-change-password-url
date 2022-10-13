# frozen_string_literal: true

require_relative "lib/rack/change-password-url/version"

Gem::Specification.new do |spec|
  spec.name = "rack-change-password-url"
  spec.version = Rack::ChangePasswordUrl::VERSION
  spec.authors = ["Taketo Takashima"]
  spec.email = ["t.taketo1113@gmail.com"]

  spec.summary = "Provides endpoint of a Well-Known URL for Changing Passwords"
  spec.description = "Provides endpoint of a Well-Known URL for Changing Passwords"
  spec.homepage = "https://github.com/taketo1113/rack-change-password-url"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/taketo1113/rack-change-password-url"
  spec.metadata["changelog_uri"] = "https://github.com/taketo1113/rack-change-password-url/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rack", ">= 2.2.3.1"

  spec.add_development_dependency "rake", ">= 13.0"
  spec.add_development_dependency "rspec", ">= 3.0"
  spec.add_development_dependency "rack-test"
end
