# frozen_string_literal: true

# Regras de acesso para /cartorio/itens_repasses
# Cartorio: ["administrador", "financeiro", "rec_firma", "registro"]
class Cartorio::ItemRepassePolicy < CartorioPolicy
  def index?
    user.grupo?(cartorio_financeiro)
  end

  def show?
    index?
  end

  def recibo?
    user.grupo?(cartorio_financeiro)
  end

  def print_dutes?
    index?
  end
end
