class ProjectPolicy < ApplicationPolicy
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

  private

  def project
    record
  end
  
end
