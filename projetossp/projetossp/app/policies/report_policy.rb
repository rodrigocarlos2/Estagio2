class ReportPolicy < ApplicationPolicy
  
  def general?
    user.permission_segment? :report, :general
  end
  
  class Scope < Scope
    def resolve
      scope
    end
  end
end
