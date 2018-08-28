class GroupPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    return true if user.present? && user == group.project.user
  end

  def new?
    return true if user.present? && user == group.project.user
  end

  def update?
    return true if user.present? && user == group.project.user
  end

  def show?
    return true if user.present? && user == group.project.user || user.admin?
  end

  def edit?
    return true if user.present? && user == group.project.user
  end

  def destroy?
    return true if user.present? && user == group.project.user || user.admin?
  end

  private

  def group
    record
  end

end
