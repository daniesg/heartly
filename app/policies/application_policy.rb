class ApplicationPolicy
  attr_reader :user, :resource

  def initialize(user, resource)
    @user = user
    @resource = resource
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def index?
    user.present?
  end

  def show?
    resource.user_id == user.id
  end

  def update?
    resource.user_id == user.id
  end

  def destroy?
    resource.user_id == user.id
  end

  def edit?
    resource.user_id == user.id
  end
end
