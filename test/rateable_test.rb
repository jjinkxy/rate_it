require 'test_helper'
require 'rate_it/rateable.rb'

describe RateIt::Rateable do
  subject { create(:rateable) }
  let(:rater) { create(:rater) }

  it 'is rateable' do
    rate = subject.rates.build(rater: rater, score: 1)
    rate.rateable.must_equal subject
  end

  it 'creates a rate' do
    subject.rate(rater, 5)
    subject.rates.wont_be_empty
  end

  it 'updates if a rater has already rated this rateable' do
    subject.rate(rater, 5)
    rate1 = rater.last_rate(subject)
    subject.rate(rater, 4)
    rate2 = rater.last_rate(subject)
    rater.last_score(subject).must_equal 4
    rate2.id.must_equal rate1.id
  end

  describe 'max score' do
    it 'has a max score default of 5' do
      subject.max_score.must_equal 5
    end

    it 'cant rate higher than max score' do
      subject.rate(rater, 7).must_be_nil
    end
  end

  describe 'overall average' do
    it 'gives an overall average' do
      another_rater = create(:rater)
      subject.rate(rater, 2)
      subject.rate(another_rater, 4)
      subject.overall_average.must_equal 3
    end
    it 'returns 0 if there is no average' do
      subject.overall_average.must_equal 0
    end
  end

  describe 'with options' do
    subject { create(:rateable_with_options) }

    it 'sets the max score' do
      subject.max_score.must_equal 2
    end
  end
end
