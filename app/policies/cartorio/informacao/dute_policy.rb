# frozen_string_literal: true

# Regras de acesso para /cartorio/informacao/dutes
# Cartorio: ["administrador", "financeiro", "rec_firma", "registro"]
class Cartorio::Informacao::DutePolicy < CartorioPolicy
  # GET /cartorio/informacao/dutes/:id/acompanhar_envio_detran
  def acompanhar_envio_detran?
    user.grupo?(cartorio_rec_firma) &&
      (record.conferencia? || record.em_envio?)
  end

  # GET /cartorio/informacao/dutes/:id/conferir_comunicacao_venda
  def conferir_comunicacao_venda?
    user.grupo?(cartorio_rec_firma) && user.entidade.bloqueio.nil? &&
      record.cartorio.eql?(user.entidade) &&
      (record.conferencia? || record.em_envio?)
  end

  # GET /cartorio/informacao/dutes/:id/enviar_comunicacao_venda
  def enviar_comunicacao_venda?
    user.grupo?(cartorio_rec_firma) && user.entidade.bloqueio.nil? &&
      record.cartorio.eql?(user.entidade) &&
      !record.envio_pendente &&
      record.conferencia?
  end

  # POST /cartorio/informacao/dutes/:id/envio_pendente
  def envio_pendente?
    user.grupo?(cartorio_rec_firma) && user.entidade.bloqueio.nil? &&
      record.cartorio.eql?(user.entidade) &&
      record.conferencia?
  end

  # GET /cartorio/informacao/dutes/importar_veiculo
  def importar_veiculo?
    informar_veiculo?
  end

  # GET /cartorio/informacao/dutes/:id/informar_comunicacao_venda
  def informar_comunicacao_venda?
    user.grupo?(cartorio_rec_firma) && user.entidade.bloqueio.nil? &&
      record.cartorio.eql?(user.entidade) &&
      ((record.pendente_de_envio? && record.created_at.today?) ||
        record.retificado?
      )
  end

  # GET /cartorio/informacao/dutes/:id/informar_imagem
  def informar_imagem?
    user.grupo?(cartorio_rec_firma) &&
      (record.cartorio.eql?(user.entidade) || (record.rtd.eql?(user.entidade) && record.registrado?)) &&
      !record.cancelado? && !record.desistencia?
  end

  # GET /cartorio/informacao/dutes/informar_pendente
  def informar_pendente?
    user.grupo?(cartorio_rec_firma) && user.entidade.bloqueio.nil?
  end

  # GET /cartorio/informacao/dutes/informar_veiculo
  def informar_veiculo?
    user.grupo?(cartorio_rec_firma) && user.entidade.bloqueio.nil?
  end

  # GET /cartorio/informacao/dutes/:id/retificar_comunicacao_venda
  def retificar_comunicacao_venda?
    user.grupo?(cartorio_rec_firma) && user.entidade.bloqueio.nil? &&
      record.conferencia?
      #|| (record.pendente_de_registro? && record.fatura.nil?))
  end

  # GET /cartorio/informacao/dutes/salvar_comunicacao_venda
  def salvar_comunicacao_venda?
    informar_comunicacao_venda?
  end

  # POST /cartorio/informacao/dutes/:id/salvar_imagem
  def salvar_imagem?
    informar_imagem?
  end

  # POST /cartorio/informacao/dutes/:id/salvar_pendente
  def salvar_pendente?
    informar_pendente?
  end

  def permitted_attributes
    keys = %i[cpf_cnpj nome endereco numend compend bairro cepend uf codmunic
              data_compra valor_compra data_autenticacao
              selo selo_certidao selo_comprador]
    keys << { procuracoes_attributes: %i[id tipo numero_procuracao data_procuracao nome_procurador
                                         cpf_procurador rg_procurador data_procuracao observacao_procuracao] }
    keys << { sinal_publicos_attributes: %i[id tipo oficio tabeliao origem selo data_selo observacao] }
    keys
  end
end
