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

  it 'has a max score default of 5' do
    subject.max_score.must_equal 5
  end

  it 'cant rate higher than max score' do
    rater = create(:rater)
    subject.rate(rater, 7).must_equal false
  end

  describe 'with options' do
    subject { create(:rateable_with_options) }

    it 'sets the max score' do
      subject.max_score.must_equal 2
    end
  end
end
