require 'test_helper'
require 'rate_it/rater.rb'

describe RateIt::Rater do
  it 'is a rater' do
    rater = create(:rater)
    rate = rater.rates.build(rateable: create(:rateable), score: 1)
    rate.rater.must_equal rater
  end
end
