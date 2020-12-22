# frozen_string_literal: true

# CartorioPolicy
class CartorioPolicy < ApplicationPolicy
  def initialize(user, record)
    super

    raise Pundit::NotAuthorizedError.new(policy: 'cartorio') unless user.cartorio?
  end

  def policy_scope(scope)
    super([:cartorio, scope])
  end

  def authorize(record, query = nil)
    super([:cartorio, record], query)
  end

  def cartorio_rec_firma
    %i[administrador rec_firma]
  end

  def cartorio_financeiro
    %i[administrador financeiro]
  end

  def cartorio_registro
    %i[administrador registro]
  end

  def grupo_cartorio
    %i[administrador financeiro rec_firma registro]
  end
end
