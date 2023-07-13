class CatReviewsController < ApplicationController
  before_action :set_cat
  before_action :set_cat_review, only: [:update, :destroy]

  def new
    authorize CatReview
    @cat = Cat.find(params[:cat_id])
    @cat_review = CatReview.new
  end

  def create
    @cat_review = CatReview.new(review_params)
    @cat_review.user = current_user
    @cat_review.cat = Cat.find(params[:cat_id])
    authorize @cat_review

    if @cat_review.save
      flash[:notice] = "Review submitted successfully."
      redirect_to cats_dashboard_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:cat_review).permit(:content, :rating)
  end
end
