class ReviewsController < ApplicationController
  def new; end

  def create
    @item   = Item.find(params[:item_id])
    @review = @item.reviews.build(review_params)

    if @review.save
      redirect_to item_path(@item), notice: 'Спасибо за отзыв!'
    else
      @reviews = @item.reviews.order(created_at: :desc).first(10)
      flash.now[:alert] = "Возникла ошибка при добавлении отзыва: #{@review.errors.full_messages.join(', ')}"
      render 'items/show'
    end
  end

  def show; end

  private

  def review_params
    params.require(:review).permit(:first_name, :last_name, :email, :rating, :comment)
  end
end
