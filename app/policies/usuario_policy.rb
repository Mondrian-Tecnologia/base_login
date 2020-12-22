class UsuarioPolicy < ApplicationPolicy
  def policy_scope(scope)
    super([:usuario, scope])
  end

  def authorize(record, query = nil)
    super([:usuario, record], query)
  end
end
