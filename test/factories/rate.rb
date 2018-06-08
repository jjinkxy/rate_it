FactoryBot.define do
  factory :rate, class: RateIt::Rate do
    rater
    rateable
    score 1
    weight 1
  end
end
