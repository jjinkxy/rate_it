# Rate It
[![Build Status](https://travis-ci.org/jjinkxy/rate_it.svg?branch=master)](https://travis-ci.org/jjinkxy/rate_it) [![Maintainability](https://api.codeclimate.com/v1/badges/1535cc1635747610a636/maintainability)](https://codeclimate.com/github/jjinkxy/rate_it/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/1535cc1635747610a636/test_coverage)](https://codeclimate.com/github/jjinkxy/rate_it/test_coverage)

**NOTE** Rate It has not been released yet

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rate_it'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rate_it

Generate the rates table migration

    $ rails g rate_it:install

And don't forget to migrate after

    $ rake db:migrate

## Usage

### Rateable Models
You must add `rate_it_rateable` to the model you want to be able to rate
```ruby
class Movie < ApplicationRecord
  rate_it_rateable
end
```
You can make multiple models rateable.
#### Available Options
A `max_score` for the rates can be set. By default the `max_score` is 5.
```ruby
class Movie < ApplicationRecord
  rate_it_rateable max_score: 6
end
@movie.max_score # => 6
```
### Rater Models
You must add `rate_it_rater` to the model you want to rate rateables like movies above
```ruby
class User < ApplicationRecord
  rate_it_rater
end
```
You can make multiple models raters.

### Available methods
A rateable can be rated on and an average rate for rateable by all raters can be calculated
```ruby
# rate(rater, score)
@movie.rate(@user1, 3)
@movie.rate(@user2, 5)

@movie.overall_average # => 8
```
A rater has a few methods available to see if they have rated for a rateable, get the score and rate instance
```ruby
# rated?(rateable)
@user1.rated?(@movie) # => false
@movie.rate(@user1, 3)
@user1.rated?(@movie) # => true

# last_rate(rateable)
@user1.last_rate(@movie) 
# => #<RateIt::Rate id: 1, rater_type: "User", rater_id: 1, rateable_type: "Movie", rateable_id: 1, score: #<BigDecimal:7fd07f24b0b0,'0.3E1',9(18)>, criterion: nil, weight: nil, created_at: "2018-06-22 11:02:25", updated_at: "2018-06-22 11:08:43">

# last_score(rateable)
@user1.last_score(@movie) => 3
```
A rater can rate a rateable with a given score. If rater rates again, their rate will get updated.
```ruby
@movie.rate(@user1, 2)
@rater.last_score(@movie) # => 2
@movie.rate(@user1, 3)
@movie.last_score # => 3
```
### View Helpers
There are two view helpers available.
```erb
# Display @user last score, no filled in stars if hasnt rated @movie yet.
# The index of the star that is clicked, rates @movie by that index for @user
<%= rate_it_for(@movie, @user) %>

# Display the overall average from all raters of @movie in stars
<%= rate_it_average(@movie) %>
```
Rate It uses CoffeeScript to have create an effect over the stars during hover.
Add Rate It to your application.js for that to work:
```
//= require rate_it
```
Rate It uses the gem 'font-awesome-rails' to display stars. Font-Awesome is added, when you add Rate It to your application.scss:
```
@import 'rate_it';
```
When a rate is submitted, it will call the action `:rate_it`.
This will need to be defined as a member route of the rateable
```ruby
resources :movies do
    put :rate_it, on: :member
end
```
and in the rated rateable's controller, for example
```ruby
def rate_it
    @movie = Movie.find(params[:id])
    @user = params[:rater_type].constantize.find(params[:rater_id])
    @movie.rate(@user, params[:score].to_i)
    respond_to do |format|
      format.js
    end
end
```

For the view helper to show the new rating the response **rate_it.js.erb** needs to be created
**rate_it.js.erb**:
```js
# To update rate_it_for
$('#<%= dom_id(@movie, :rating) %>').replaceWith('<%= escape_javascript(rate_it_for(@movie, @user)) %>')
# To update rate_it_average
$('#<%= dom_id(@movie, :avg_rating) %>').replaceWith('<%= escape_javascript(rate_it_average(@movie)) %>')
```

## Tests

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rate_it. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RateIt project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rate_it/blob/master/CODE_OF_CONDUCT.md).
