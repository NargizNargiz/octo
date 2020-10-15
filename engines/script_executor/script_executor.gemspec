$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "script_executor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "script_executor"
  spec.version     = ScriptExecutor::VERSION
  spec.authors     = ["Kempirova Nargiz"]
  spec.email       = ["nargiz1397@mail.ru"]
  spec.homepage    = "https://github.com/octoshell/octoshell-v2"
  spec.summary     = "Step by step script execution"
  spec.description = "Description of ScriptExecutor"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.4", ">= 5.2.4.3"

  spec.add_development_dependency "sqlite3"
  spec.add_dependency "aasm"
  spec.add_development_dependency 'rspec-rails'
  spec.test_files = Dir["spec/**/*"]
end
