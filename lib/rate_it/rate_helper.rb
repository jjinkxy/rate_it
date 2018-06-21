module RateIt
  module RateHelper
    def rate_it_for(rateable, rater)
      score = rater.last_score(rateable)
      rater_star_content(rateable, rater, score)
    end

    def rateable_score_path(rateable, rater, score)
      polymorphic_url(
        [:rate_it, rateable],
        rater_id: rater.id,
        rater_type: rater.model_name.human,
        score: score
      )
    end

    def rater_star_content(rateable, rater, score)
      content_tag :div, id: dom_id(rateable, :rating), value: score do
        concat safe_join((1..rateable.max_score).map do |i|
          icon = i <= score ? 'fa-star' : 'fa-star-o'
          link_to content_tag(:i, '', value: i, class: "fa #{icon} rate_it_star"),
                  rateable_score_path(rateable, rater, i),
                  method: :put, remote: true
        end)
      end
    end

    def rate_it_average(rateable)
      score = rateable.overall_average
      average_star_content(rateable, score)
    end

    def average_star_content(rateable, score)
      content_tag :div, id: dom_id(rateable, :avg_rating) do
        concat safe_join((1..rateable.max_score).map do |i|
          icon = i <= score ? 'fa-star' : 'fa-star-o'
          content_tag(:i, '', class: "fa #{icon}")
        end)
      end
    end
  end
end
ActionView::Base.send :include, RateIt::RateHelper
