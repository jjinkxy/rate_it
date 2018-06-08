require 'test_helper'
require 'rate_it/rate'

describe RateIt::Rate do
  subject { create(:rate) }

  it 'valid rate' do
    assert subject.valid?
  end

  it 'invalid without rater' do
    rate = build(:rate, rater: nil)
    refute rate.valid?
    refute_nil rate.errors[:rater], 'Expected rater to be a present, it is not'
  end

  it 'invalid without rateable' do
    rate = build(:rate, rateable: nil)
    refute rate.valid?
    refute_nil rate.errors[:rateable], 'Expected rateable to be a present, it is not'
  end

  it 'invalid without score' do
    rate = build(:rate, score: nil)
    refute rate.valid?
    refute_nil rate.errors[:score], 'Expected score to be a present, it is not'
  end

  it 'invalid if score isnt a number' do
    rate = build(:rate, score: 'nan')
    refute rate.valid?
    refute_nil rate.errors[:score], 'Expected score to be a number, it is not'
  end

  it 'defaults weight to 1' do
    rate = create(:rate, weight: nil)
    assert_equal 1, rate.weight, 'Expected weight to be 1, it is not'
  end

  it 'weight can be set' do
    rate = create(:rate, weight: 2)
    assert_equal 2, rate.weight, 'Expected weight to set something other than 1, it is not'
  end
end
