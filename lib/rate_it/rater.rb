module RateIt
  module Rater
    extend ActiveSupport::Concern

    def self.included(base)
      base.extend(ClassMethods)
    end
    module ClassMethods
      def rate_it_rater
        has_many :rates, as: :rater, class_name: 'RateIt::Rate', dependent: :destroy
      end
    end
  end
end
ActiveRecord::Base.send(:include, RateIt::Rater)
