require 'rails/generators'

module RateIt
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path('templates', __dir__)

    desc 'Creates rate_it migration for your application'
    def self.next_migration_number(_dir)
      Time.now.utc.strftime('%Y%m%d%H%M%S')
    end

    def create_migrations
      migration_template 'create_rates.rb', 'db/migrate/rate_it_create_rates.rb'
    end
  end
end
