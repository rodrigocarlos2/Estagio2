class AuditorPolicy < ApplicationPolicy
  def index?
    user.permission_segment? :auditor, :index
  end
    
  def show?
    user.permission_segment? :auditor, :show
  end
    
  class Scope < Scope
    def resolve
      scope
    end
  end
end
