require 'test_helper'
require 'rate_it/rater.rb'

describe RateIt::Rater do
  subject { create(:rater) }
  it 'is a rater' do
    rate = subject.rates.build(rateable: create(:rateable), score: 1)
    rate.rater.must_equal subject
  end
  describe 'rated?' do
    let(:rateable) { create(:rateable) }
    it 'shows if has not rated rateable' do
      subject.rated?(rateable).must_equal false
    end

    it 'shows if has not rated rateable' do
      subject.rates.create(rateable: rateable, score: 3)
      subject.rated?(rateable).must_equal true
    end
  end
end
