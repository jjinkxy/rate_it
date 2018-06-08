require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'rate_it'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'
require 'factory_bot'

class Minitest::Spec
  include FactoryBot::Syntax::Methods

  # needs to be defined for Rails 4 (Rails 4 default is :sorted, rails 5 default is :random)
  def self.test_order
    ActiveSupport.test_order ||= :random
  end
end
