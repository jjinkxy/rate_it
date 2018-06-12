require 'test_helper'
require 'rate_it/rateable.rb'

describe RateIt::Rateable do
  subject { create(:rateable) }
  it 'is rateable' do
    rate = subject.rates.build(rater: create(:rater), score: 1)
    rate.rateable.must_equal subject
  end
  it 'creates a rate' do
    rater = create(:rater)
    subject.rate(rater, 5)
    subject.rates.wont_be_empty
  end
end
