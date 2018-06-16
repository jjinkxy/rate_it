module RateIt
  module Rater
    extend ActiveSupport::Concern

    included do
      def rated?(rateable)
        rates.where(rateable: rateable).any?
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
