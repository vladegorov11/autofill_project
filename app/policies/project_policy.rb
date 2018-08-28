class ProjectPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if user.admin?
         scope
      else
         scope.where(user_id: user.id)
      end
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
    return true if user.present? && user == project.user || user.admin?
  end

  def edit?
    return true if user.present? && user == project.user
  end

  def destroy?
    return true if user.present? && user == project.user || user.admin?
  end

  def archive?
    true
  end

  def regenerate_token?
    return true if user.present? && user == project.user
  end

  def archived?
    return true if user.present? && user == project.user
  end
  private

  def project
    record
  end

end
