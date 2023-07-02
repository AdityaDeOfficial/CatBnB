class UserReviewPolicy
  attr_reader :user_review, :user

  def initialize(user, user_review)
    @user = user
    @user_review = user_review
  end

  def new?
    true
  end

  def create?
    true
  end
end
