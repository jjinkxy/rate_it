require 'test_helper'
require 'rate_it/rateable.rb'

describe RateIt::Rateable do
  it 'is rateable' do
    rateable = create(:rateable)
    rate = rateable.rates.build(rater: create(:rater), score: 1)
    rate.rateable.must_equal rateable
  end
end
