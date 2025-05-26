class OrderRequestsController < ApplicationController
  def new
    @order_request = OrderRequest.new
  end

  def create
    if order_request_params.present?
      @order_request = OrderRequest.build(order_request_params)

      if @order_request.save
        redirect_to home_index_path, notice: 'Заявка создана успешно!'
      else
        @items = Item.order(created_at: :desc).first(10)
        flash.now[:alert] = "Возникла ошибка при создании заявки: #{@order_request.errors.full_messages.join(', ')}"
        render 'home/index'
      end
    end
  end

  private

  def order_request_params
    params.require(:order_request).permit(:first_name, :last_name, :email, :phone)
  end
end
