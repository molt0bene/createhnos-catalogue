class HomeController < ApplicationController
  def index
    @items = Item.order(created_at: :desc).first(10)
    @order_request = OrderRequest.new(order_request_params) if order_request_params.present?
  end

  private

  def order_request_params
    params.permit(:first_name, :last_name, :email, :phone)
  end
end
