class Rater < ActiveRecord::Base
  rate_it_rater
end

class Rateable < ActiveRecord::Base
  rate_it_rateable
end

class RateableWithOptions < Rateable
  rate_it_rateable max_score: 2
end
