class AssistantController < ApplicationController
  protect_from_forgery with: :null_session # для JSON API

  def recommend
    filters = params.permit(:category, :price, :color)

    items = Item.all
    items = items.where(category: filters[:category]) if filters[:category].present?
    items = items.where(color: filters[:color]) if filters[:color].present?

    if filters[:price].present?
      case filters[:price]
      when /до/i then items = items.where("price < 5000")
      when /5.*15/i then items = items.where(price: 5000..15000)
      when /выше/i then items = items.where("price > 15000")
      end
    end

    render json: items.limit(3).map { |p| { name: p.name, url: item_url(p) } }
  end
end
