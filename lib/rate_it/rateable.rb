module RateIt
  module Rateable
    extend ActiveSupport::Concern

    included do
      def rate(rater, score)
        return false if score > max_score
        rates.create(rater: rater, score: score)
      end
    end

    class_methods do
      def rate_it_rateable(options = {})
        has_many :rates, as: :rateable, class_name: 'RateIt::Rate', dependent: :destroy
        class_attribute :max_score
        self.max_score = options[:max_score] || 5
      end
    end
  end
end
ActiveRecord::Base.send(:include, RateIt::Rateable)
