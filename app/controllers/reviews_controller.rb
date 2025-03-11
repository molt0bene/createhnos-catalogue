class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show destroy]

  def create
    @review = Review.new(create_params)

    if @review.save
      redirect_to root_path, notice: 'Ваш отзыв добавлен'
    else
      flash.now[:alert] = "Возникла ошибка при добавлении отзыва"
      render :new
    end
  end

  def show; end

  def destroy
    @review.destroy
    redirect_to root_path, notice: 'Отзыв удален' # TODO: редирект на страницу продукта
  end

  private

  def set_review
    @review = Review.find_by(id: params[:id])
  end

  def create_params
    params.require(:review).permit(:user_id, :rating, :comment)
  end
end
