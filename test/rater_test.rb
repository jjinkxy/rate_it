require 'test_helper'
require 'rate_it/rater.rb'

describe RateIt::Rater do
  subject { create(:rater) }
  let(:rateable) { create(:rateable) }
  it 'is a rater' do
    rate = subject.rates.build(rateable: rateable, score: 1)
    rate.rater.must_equal subject
  end
  describe 'rated?' do
    it 'shows if has not rated rateable' do
      subject.rated?(rateable).must_equal false
    end

    it 'shows if has not rated rateable' do
      subject.rates.create(rateable: rateable, score: 3)
      subject.rated?(rateable).must_equal true
    end
  end

  describe 'last_rate' do
    it 'returns last rate of given rateable' do
      subject.rates.create(rateable: rateable, score: 3)
      subject.last_rate(rateable).must_equal subject.rates.where(rateable: rateable).last
    end
    it 'return nil if not rated yet' do
      subject.last_rate(rateable).must_be_nil
    end
  end

  describe 'last score' do
    it 'returns 0 if not rated' do
      subject.last_score(rateable).must_equal 0
    end

    it 'returns last score of rateable' do
      rate = subject.rates.create(rateable: rateable, score: 3)
      subject.last_score(rateable).must_equal rate.score
    end
  end
end
