class HomeController < ApplicationController
  def index
    @items = Item.order(created_at: :desc).first(10)
  end
end
