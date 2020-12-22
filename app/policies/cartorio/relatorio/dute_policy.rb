# frozen_string_literal: true

# Regras de acesso para /cartorio/relatorio/dutes
# Cartorio: ["financeiro", "atendimento", "mondrian", "mondrian_atendimento"]
class Cartorio::Relatorio::DutePolicy < CartorioPolicy
  def pendentes_repasse?
    user.grupo?(cartorio_financeiro)
  end
end
