class ReviewsController < ApplicationController
  def new; end

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

  private

  def create_params
    params.require(:review).permit(:first_name, :last_name, :rating, :comment)
  end
end
