module RateIt
  module Rateable
    extend ActiveSupport::Concern

    def self.included(base)
      base.extend(ClassMethods)
    end
    module ClassMethods
      def rate_it_rateable
        has_many :rates, as: :rateable, class_name: 'RateIt::Rate', dependent: :destroy
      end
    end
  end
end
ActiveRecord::Base.send(:include, RateIt::Rateable)
