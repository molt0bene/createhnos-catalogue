class ItemsController < ApplicationController
  def create # TODO: check admin rights
  end

  def update
  end

  def destroy
  end

  def show
    @question = Item.find(params[:id])
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

