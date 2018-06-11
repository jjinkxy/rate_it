class Rater < ActiveRecord::Base
end

class Rateable < ActiveRecord::Base
  rate_it_rateable
end
