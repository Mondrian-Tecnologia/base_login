# frozen_string_literal: true

# Regras de acesso para /cartorio/faturas
# Cartorio: ["administrador", "financeiro", "rec_firma", "registro"]
class Cartorio::FaturaPolicy < CartorioPolicy
  def index?
    user.grupo?(cartorio_financeiro)
  end

  def show?
    index?
  end

  def print_dutes?
    index?
  end
end
