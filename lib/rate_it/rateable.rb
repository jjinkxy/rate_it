module RateIt
  module Rateable
    extend ActiveSupport::Concern

    included do
      def rate(rater, score)
        rates.create(rater: rater, score: score)
      end

      def max_score
        self.class.max_score
      end
    end

    class_methods do
      def rate_it_rateable(options = {})
        has_many :rates, as: :rateable, class_name: 'RateIt::Rate', dependent: :destroy
        class << self
          attr_accessor :max_score
        end
        self.max_score = options[:max_score] || 5
      end
    end
  end
end
ActiveRecord::Base.send(:include, RateIt::Rateable)
