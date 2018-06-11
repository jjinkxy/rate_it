class Rater < ActiveRecord::Base
  rate_it_rater
end

class Rateable < ActiveRecord::Base
  rate_it_rateable
end
