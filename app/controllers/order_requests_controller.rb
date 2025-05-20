class OrderRequestsController < ApplicationController
  def new
    @order_request = OrderRequest.new(order_request_params) if order_request_params.present?
  end

  private

  def order_request_params
    params.require(:order_request).permit(:first_name, :last_name, :email, :phone)
  end
end
