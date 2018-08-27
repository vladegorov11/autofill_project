class ProjectPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end

  def index?
    true
  end

  def create?
    user.present?
  end

  def new?
    user.present?
  end


  def update?
    return true if user.present? && user == project.user
  end

  def show?
    return true if user.present? && user == project.user
  end

  def edit?
    return true if user.present? && user == project.user
  end

  def destroy?
    return true if user.present? && user == project.user
  end

  def archive?
    true
  end
  private

  def project
    record
  end

end
