class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.permission_segment? record, :index
  end

  def show?
    #scope.where(:id => record.id).exists?
    user.permission_segment? record, :show
  end

  def create?
    user.permission_segment? record, :create
  end

  def new?
    create?
  end

  def update?
    user.permission_segment? record, :update
  end

  def edit?
    update?
  end

  def destroy?
    user.permission_segment? record, :destroy
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
