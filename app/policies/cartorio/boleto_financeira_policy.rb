# frozen_string_literal: true

# Regras de acesso para /cartorio/boleto_financeiras
# Cartorio: ["administrador", "financeiro", "rec_firma", "registro"]
class Cartorio::BoletoFinanceiraPolicy < CartorioPolicy
  def show?
    user.grupo?(:financeiro) &&
      record.fatura.cartorio_id.eql?(user.entidade_id) &&
      !record.fatura.pago?
  end
end
