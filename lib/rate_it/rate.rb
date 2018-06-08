module RateIt
  class Rate < ActiveRecord::Base
    belongs_to :rater, polymorphic: true
    belongs_to :rateable, polymorphic: true

    validates :rater, presence: true
    validates :rateable, presence: true
    validates :score, presence: true
    validates :score, numericality: { greater_than_or_equal_to: 1, smaller_than_or_equal_to: 50 }

    after_save :default_values

    def default_values
      self.weight ||= 1
    end
  end
end
