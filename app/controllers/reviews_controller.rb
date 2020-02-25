class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = review.new(review_params)
    # @user = User.find(params[:user_id])
    # @booking = Booking.find(params[:booking_id])
    if @review.save
    # redirect_to booking_path(@booking.id)
    # redirect_to user_path(@user.id)
    else
      render :new
    end
  end

    private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
