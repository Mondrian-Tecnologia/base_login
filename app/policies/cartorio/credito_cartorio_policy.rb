# frozen_string_literal: true

# Regras de acesso para /cartorio/credito_cartorios
# Cartorio: ["administrador", "financeiro", "rec_firma", "registro"]
class Cartorio::CreditoCartorioPolicy < CartorioPolicy
  def index?
    user.grupo?(cartorio_financeiro)
  end

  def show?
    index?
  end
end
