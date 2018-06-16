module RateIt
  module Rater
    extend ActiveSupport::Concern

    included do
      def rated?(rateable)
        rates.where(rateable: rateable).any?
      end

      def last_score(rateable)
        rated?(rateable) ? rates.where(rateable: rateable).last.score : 0
      end
    end

    class_methods do
      def rate_it_rater
        has_many :rates, as: :rater, class_name: 'RateIt::Rate', dependent: :destroy
      end
    end
  end
end
ActiveRecord::Base.send(:include, RateIt::Rater)
