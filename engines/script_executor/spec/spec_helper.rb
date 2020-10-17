require 'rspec/autorun'
ENV["RAILS_ENV"] ||= "test"

Rails.backtrace_cleaner.remove_silencers!
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.order = "random"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
end
# This file is copied to spec/ when you run 'rails generate rspec:install'

require File.expand_path("../dummy/config/environment.rb", __FILE__)

require "rspec/rails"
require "rspec/autorun"
require "shoulda-matchers"


ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')
puts Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")]
