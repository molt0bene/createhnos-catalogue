class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews.order(created_at: :desc).first(10)
    @review = @item.reviews.build
  end

  def index
    @items = Item.order(created_at: :desc).first(10)
  end

  private

  def check_admin_rights; end
end

