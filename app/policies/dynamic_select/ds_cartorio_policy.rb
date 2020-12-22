class DynamicSelect::DsCartorioPolicy < DynamicSelectPolicy
  def index?
    true
  end

  class Scope < Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
