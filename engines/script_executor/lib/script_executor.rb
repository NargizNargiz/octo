require "script_executor/engine"
require 'rubygems'
Gem.loaded_specs['script_executor'].dependencies.each do |d|
  require d.name
end
module ScriptExecutor
  # Your code goes here...
  class Engine < ::Rails::Engine
      paths["app"]                 # => ["app"]
      paths["app/controllers"]     # => ["app/controllers"]
      paths["app/helpers"]         # => ["app/helpers"]
      paths["app/models"]          # => ["app/models"]
      paths["app/views"]           # => ["app/views"]
      paths["app/services"]
      paths["lib"]                 # => ["lib"]
      paths["lib/tasks"]           # => ["lib/tasks"]
      paths["config"]              # => ["config"]
      paths["config/initializers"] # => ["config/initializers"]
      paths["config/locales"]      # => ["config/locales"]
      paths["config/routes.rb"]    # => ["config/routes.rb"]
  end
end

#
# class ScriptExecutor < Rails::Engine
#   paths["app"]                 # => ["app"]
#   paths["app/controllers"]     # => ["app/controllers"]
#   paths["app/helpers"]         # => ["app/helpers"]
#   paths["app/models"]          # => ["app/models"]
#   paths["app/views"]           # => ["app/views"]
#   paths["app/services"]
#   paths["lib"]                 # => ["lib"]
#   paths["lib/tasks"]           # => ["lib/tasks"]
#   paths["config"]              # => ["config"]
#   paths["config/initializers"] # => ["config/initializers"]
#   paths["config/locales"]      # => ["config/locales"]
#   paths["config/routes.rb"]    # => ["config/routes.rb"]
# end

