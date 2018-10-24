# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]
  load_and_authorize_resource :review

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @review = @restaurant.reviews.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to restaurants_url, notice: 'Review was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Review was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.require(:review).permit(:rating, :comment, :user_id)
  end
end
