class DynamicSelectPolicy < ApplicationPolicy
  def policy_scope(scope)
    super([:dynamic_select, scope])
  end

  def authorize(record, query = nil)
    super([:dynamic_select, record], query)
  end
end
