# frozen_string_literal: true

# Regras de acesso para /cartorio/informacao/dutes/:dute_id/procuracoes
# Cartorio: ["administrador", "financeiro", "rec_firma", "registro"]
class Cartorio::Informacao::ProcuracaoPolicy < CartorioPolicy
  # GET /cartorio/informacao/dutes/:id/procuracoes/new
  def new?
    create?
  end

  # GET /cartorio/informacao/dutes/:id/procuracoes/:id/edit
  def edit?
    update?
  end

  # POST /cartorio/informacao/dutes/:id/procuracoes
  def create?
    dute = record.dute

    user.grupo?(cartorio_rec_firma) &&
      user.entidade.eql?(dute.cartorio) &&
      dute.procuracoes.where(tipo: record.tipo).blank?
  end

  # PATCH /cartorio/informacao/dutes/:id/procuracoes/:id
  def update?
    dute = record.dute

    user.grupo?(cartorio_rec_firma) &&
      user.entidade.eql?(dute.cartorio) &&
      dute.send("procuracao_#{record.tipo}").eql?(record)
  end

  # DELETE /cartorio/informacao/dutes/:id/procuracoes/:id
  def destroy?
    dute = record.dute

    user.grupo?(cartorio_rec_firma) &&
      user.entidade.eql?(dute.cartorio) &&
      record.id
  end
end
