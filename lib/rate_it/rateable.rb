module RateIt
  module Rateable
    extend ActiveSupport::Concern

    included do
      def rate(rater, score)
        rates.create(rater: rater, score: score)
      end
    end
    class_methods do
      def rate_it_rateable
        has_many :rates, as: :rateable, class_name: 'RateIt::Rate', dependent: :destroy
      end
    end
  end
end
ActiveRecord::Base.send(:include, RateIt::Rateable)
