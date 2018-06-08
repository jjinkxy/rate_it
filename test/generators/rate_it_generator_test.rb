require 'test_helper'
require 'generators/rate_it/rate_it_generator'

class RateItGeneratorTest < Rails::Generators::TestCase
  tests RateIt::RateItGenerator
  destination File.expand_path('../tmp', File.dirname(__FILE__))
  setup :prepare_destination

  test 'generator runs without errors' do
    assert_nothing_raised do
      run_generator ['arguments']
    end
  end
  test 'generates migration' do
    run_generator
    assert_migration 'db/migrate/rate_it_create_rates.rb'
  end
end
