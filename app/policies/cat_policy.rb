class CatPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
      #scope.all is the same as restaurant.all
      # scope.where(user_id: user_id) #can delete id, (user: user) kept it for study purposes
      # aka scope.where(user_id: current_user)
      #SELECT * FROM cats WHERE user_id = 2
    end
  end

  def dashboard?
    return true
  end

  def show?
    return true
  end

  def new?
    create?
  end

  def create?
    return true
  end

  def edit？
    update？
  end

  def update?
    true
  end

  def destroy
    return true
  end
end
