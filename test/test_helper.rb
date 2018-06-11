require 'simplecov'
SimpleCov.start
require 'rate_it'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'
require 'active_record'
require 'factory_bot'
require 'support/factory_bot'
require 'sqlite3'

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
require 'support/schema' # needs to happen after establish_connection
require 'support/models' # needs to happen after schema
