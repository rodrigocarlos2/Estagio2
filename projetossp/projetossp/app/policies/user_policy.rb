class UserPolicy < ApplicationPolicy
  
  def change_approved?
    user.permission_segment? :user, :change_approved
  end
  
  class Scope < Scope
    def resolve
      scope
    end
  end
end
