require 'simplecov'
SimpleCov.start

require 'combustion'
Combustion.path = 'test/internal'
Combustion.initialize! :active_record, :action_controller, :action_view

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

# require "rails/test_help"
require 'rate_it'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'
require 'support/factory_bot'
require 'capybara/rails'
require 'capybara/minitest'
require 'capybara/minitest/spec'

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new
# Taken from Capybara Gem README
class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
  # Make `assert_*` methods behave like Minitest assertions
  include Capybara::Minitest::Assertions

  # Reset sessions and driver between tests
  # Use super wherever this method is redefined in your individual test classes
  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
