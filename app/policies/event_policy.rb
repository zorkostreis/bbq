class EventPolicy < ApplicationPolicy
  
  def edit?
    update?
  end

  def update?
    @record.user == @user
  end

  def destroy?
    update?
  end
end
