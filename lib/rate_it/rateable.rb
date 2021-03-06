module RateIt
  module Rateable
    extend ActiveSupport::Concern

    included do
      def rate(rater, score)
        return if score > max_score
        if rater.rated?(self)
          rater.last_rate(self).update(score: score)
        else
          rates.create(rater: rater, score: score)
        end
      end

      def overall_average
        return 0 unless rates.any?
        rates.average(:score)
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
