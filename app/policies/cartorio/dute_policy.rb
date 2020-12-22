# frozen_string_literal: true

# Regras de acesso para /cartorio/dutes
# Cartorio: ["administrador", "financeiro", "rec_firma", "registro"]
class Cartorio::DutePolicy < CartorioPolicy
  # GET /cartorio/dutes
  def index?
    user.grupo?(grupo_cartorio)
  end

  # GET /cartorio/dutes/:id
  def show?
    index?
  end

  # GET /cartorio/dutes/:id/cancelar
  # Usuarios de cartorio podem cancelar suas informacoes, desde que:
  # Status: pendente_de_envio?
  #         pendente_de_registro?
  #         conferencia? && num_protocolo.nil?
  def cancelar?
    user.grupo?(cartorio_rec_firma) && user.entidade_id.eql?(record.cartorio_id) &&
      (record.pendente_de_envio? || record.pendente_de_registro? ) && record.fatura.nil?
  end

  # GET /cartorio/informacao/dutes/envio_pendente
  def envio_pendente?
    user.grupo?(cartorio_rec_firma)
  end

  # GET /cartorio/dutes/:id/desistir
  def desistir?
    user.grupo?(cartorio_rec_firma) &&
      user.entidade.eql?(record.cartorio) &&
      ( record.registrado? || record.fatura.present? )
  end

  # GET /cartorio/dutes/:id/imprimir
  def imprimir?
    (record.cartorio_id.eql?(user.entidade_id) || record.rtd_id.eql?(user.entidade_id)) &&
      (
        (record.envio_pendente && !record.enviado) ||
        %w[pendente_de_registro registrado desistencia].include?(record.status)
      )
  end

  def consultar_por_periodo?
    user.grupo?(grupo_cartorio)
  end
end
