class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @property = @booking.property
    # @user = User.find(params[:user_id])
    # @booking = Booking.find(params[:booking_id])
    @property.user = current_user
    if @review.save
    redirect_to property_path(@property.id)
    # redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

    private

  def review_params
    params.require(:review).permit(:rating, :content, :booking_id)
  end
end
