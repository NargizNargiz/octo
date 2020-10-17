require "script_executor/engine"
require 'rubygems'
Gem.loaded_specs['script_executor'].dependencies.each do |d|
  require d.name
end
module ScriptExecutor
  # Your code goes here...
  class Engine < ::Rails::Engine
  end
end
