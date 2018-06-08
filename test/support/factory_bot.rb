class Minitest::Spec
  include FactoryBot::Syntax::Methods
  FactoryBot.find_definitions
  # needs to be defined for Rails 4 (Rails 4 default is :sorted, rails 5 default is :random)
  def self.test_order
    ActiveSupport.test_order ||= :random
  end
end
