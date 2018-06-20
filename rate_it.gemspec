$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'rate_it/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name          = 'rate_it'
  spec.version       = RateIt::VERSION
  spec.authors       = ['Julia Jochum']
  spec.email         = ['jj@denkungsart-gmbh.de']

  spec.summary       = 'Add rating functionality to your Rails App'
  spec.description   = 'A rating gem, where multiple models can rate multiple models.'
  spec.homepage      = 'https://github.com/jjinkxy/rate_it'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__, __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  # s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # s.add_dependency "rails", "~> 5.2.0"

  spec.add_development_dependency 'actionpack'
  spec.add_development_dependency 'activerecord'
  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'combustion', '~> 0.9.1'
  spec.add_development_dependency 'factory_bot', '~> 4.10'
  spec.add_development_dependency 'minitest', '~> 5.10.3'
  spec.add_development_dependency 'rubocop', '~> 0.57.1'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'sqlite3', '~> 1.3'
end
