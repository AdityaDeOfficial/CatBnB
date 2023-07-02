class UserReviewsController < ApplicationController
  def new
    authorize UserReview
    @user_review = UserReview.new
  end

  def create
    @user_review = UserReview.new(review_params)
    @user_review.user = current_user
    authorize @user_review

    if @user_review.save
      flash[:notice] = "Review submitted successfully."
      redirect_to cats_dashboard_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:user_review).permit(:content, :rating)
  end
end
