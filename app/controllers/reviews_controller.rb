class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
    @property = Property.find(params[:property_id])
  end

  def new
    @property = Property.find(params[:property_id])
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # @property = Property.find(review_params[:property_id].to_i)
    @booking = Booking.find(params[:booking_id].to_i)
    @booking.property = @property
    @review.user = current_user
    @review.booking = @booking
    @property = Property.find(params[:property_id])
    if @review.save!
      redirect_to property_path(@property)
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
    params.require(:review).permit(:rating, :content, :property_id, :booking_id, :id)
  end
end
