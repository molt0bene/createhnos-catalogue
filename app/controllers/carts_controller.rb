class CartsController < ApplicationController
  before_action :set_cart

  def show
    @items = @cart.items
  end

  def add
    @cart.add_item(params[:item_id])
    redirect_to cart_path, notice: "Товар добавлен в корзину!"
  end

  def remove
    @cart.remove_item(params[:item_id])
    redirect_to cart_path, notice: "Товар удален из корзины."
  end

  def clear
    @cart.clear
    redirect_to cart_path, notice: "Корзина очищена."
  end

  private

  def set_cart
    @cart = Cart.new(current_user.id)
  end
end

