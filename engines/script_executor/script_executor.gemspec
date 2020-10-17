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

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  spec.test_files = Dir["spec/**/*"]
  spec.platform = 'java' if RUBY_ENGINE == 'jruby'

  spec.add_dependency "rails", "~> 5.2.4", ">= 5.2.4.3"

  spec.add_development_dependency "sqlite3"
  spec.add_dependency "aasm"
  spec.add_dependency 'rspec-rails'
  spec.add_dependency 'railroady'
  # spec.add_development_dependency 'web-console'
    # , '>= 3.3.0'
  spec.add_dependency 'listen'
  # spec.add_development_dependency 'spring'
  # spec.add_development_dependency 'spring-watcher-listen', '~> 2.0.0'
  spec.add_dependency 'bootsnap', '>= 1.1.0'
  # spec.add_development_dependency 'jbuilder', '~> 2.5'
  # spec.add_development_dependency 'sass-rails', '~> 5.0'
  spec.add_dependency 'uglifier', '>= 1.3.0'
  spec.add_dependency 'turbolinks', '~> 5'
  spec.add_dependency 'puma'
  # spec.add_development_dependency 'faker'
  # spec.add_development_dependency 'tzinfo-data'
  spec.add_dependency "factory_bot_rails"
  spec.add_dependency 'byebug'
  spec.add_dependency 'pry'
  spec.test_files = Dir["spec/**/*"]
end
