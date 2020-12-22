# frozen_string_literal: true

# Regras de acesso para /cartorio/cartorios
# Cartorio: ["administrador", "financeiro", "rec_firma", "registro"]
class Cartorio::CartorioPolicy < CartorioPolicy
  def edit?
    user.grupo?(cartorio_financeiro)
  end

  def update?
    edit?
  end
end
