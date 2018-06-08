require 'rails/generators'
require 'rails/generators/migration'

module RateIt
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path('templates', __dir__)

    desc 'Creates rate_it migration for your application'
    def create_migration
      template 'create_rates_table.rb', 'db/migrate/rate_it_create_rates.rb'
    end
  end
end
