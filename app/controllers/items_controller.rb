class ItemsController < ApplicationController
  def update
  end

  def destroy
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.order(created_at: :desc).first(10)
  end

  def new
  end

  def edit
  end

  private

  def check_admin_rights; end
end

