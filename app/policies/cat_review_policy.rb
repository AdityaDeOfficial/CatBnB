class CatReviewPolicy
  attr_reader :cat_review, :user

  def initialize(user, cat_review)
    @user = user
    @cat_review = cat_review
  end

  def new?
    true
  end

  def create?
    true
  end
end
