class CatPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
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
  end
end
