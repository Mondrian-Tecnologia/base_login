# frozen_string_literal: true

# Regras de acesso para /cartorio/usuarios
# Cartorio: ["administrador", "financeiro", "rec_firma", "registro"]
class Cartorio::UsuarioPolicy < CartorioPolicy
  def index?
    user.grupo?(:administrador)
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def create?
    user.grupo?(:administrador)
  end

  def update?
    user.grupo?(:administrador)
  end

  def bloquear?
    user.grupo?(:administrador) &&
      record.locked_at.nil? &&
      !user.eql?(record)
  end

  def desbloquear?
    user.grupo?(:administrador) &&
      record.locked_at
  end
end
