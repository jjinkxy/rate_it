require 'test_helper'
require 'rate_it/rate'

describe RateIt::Rate do
  subject { create(:rate) }

  it 'valid rate' do
    subject.must_be :valid?
  end

  it 'invalid without rater' do
    rate = build(:rate, rater: nil)
    rate.wont_be :valid?
    rate.errors[:rater].wont_be_nil
  end

  it 'invalid without rateable' do
    rate = build(:rate, rateable: nil)
    rate.wont_be :valid?
    rate.errors[:rateable].wont_be_nil
  end

  it 'invalid without score' do
    rate = build(:rate, score: nil)
    rate.wont_be :valid?
    rate.errors[:score].wont_be_nil
  end

  it 'invalid if score isnt a number' do
    rate = build(:rate, score: 'nan')
    rate.wont_be :valid?
    rate.errors[:score].wont_be_nil
  end

  it 'defaults weight to 1' do
    rate = create(:rate, weight: nil)
    rate.weight.must_equal 1
  end

  it 'weight can be set' do
    rate = create(:rate, weight: 2)
    rate.weight.must_equal 2
  end
end
