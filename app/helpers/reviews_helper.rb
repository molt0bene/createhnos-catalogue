module ReviewsHelper
  def render_stars(rating)
    stars = []
    rating.times { stars << content_tag(:i, "", class: "fa-solid fa-star filled") }

    safe_join(stars, " ")
  end
end
