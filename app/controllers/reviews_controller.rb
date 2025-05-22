class ReviewsController < ApplicationController
  def new; end

  def create
    @item   = Item.find(params[:item_id])
    @review = Review.new(create_params.merge({item_id: @item.id}))

    # byebug
    if @review.save
      redirect_to item_path(@item), notice: 'Спасибо за отзыв!'
    else
      flash.now[:alert] = "Возникла ошибка при добавлении отзыва"
      render 'items/show'
    end
  end

  def show; end

  private

  def create_params
    params.require(:review).permit(:first_name, :last_name, :email, :rating, :comment)
  end
end
