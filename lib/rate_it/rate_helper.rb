# require 'font-awesome-rails'

module RateIt
  module RateHelper
    def rate_it_for(rateable, rater, score)
      link_to polymorphic_url(
        [:rate_it, rateable],
        rater: rater.id,
        rater_type: rater.model_name.human,
        score: score
      ), method: :put, remote: true do
        star_content_tag(rateable, score)
      end
    end

    def star_content_tag(rateable, score)
      content_tag :div, id: dom_id(rateable, :rating) do
        concat safe_join((1..score).map do
          fa_icon('star')
        end)
        concat safe_join((1..(rateable.max_score - score)).map do
          fa_icon('star-o')
        end)
      end
    end
  end
end
ActionView::Base.send :include, RateIt::RateHelper
