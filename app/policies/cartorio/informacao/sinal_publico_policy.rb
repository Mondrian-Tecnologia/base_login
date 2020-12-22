# frozen_string_literal: true

# Regras de acesso para /cartorio/informacao/dutes/:dute_id/sinal_publicos
# Cartorio: ["administrador", "financeiro", "rec_firma", "registro"]
class Cartorio::Informacao::SinalPublicoPolicy < CartorioPolicy
  # GET /cartorio/informacao/dutes/:id/sinal_publicos/new
  def new?
    create?
  end

  # GET /cartorio/informacao/dutes/:id/sinal_publicos/:id/edit
  def edit?
    update?
  end

  # POST /cartorio/informacao/dutes/:id/sinal_publicos
  def create?
    dute = record.dute

    user.grupo?(cartorio_rec_firma) &&
      user.entidade.eql?(dute.cartorio) &&
      dute.sinal_publicos.where(tipo: record.tipo).blank?
  end

  # PATCH /cartorio/informacao/dutes/:id/sinal_publicos/:id
  def update?
    dute = record.dute

    user.grupo?(cartorio_rec_firma) &&
      user.entidade.eql?(dute.cartorio) &&
      dute.send("sinal_publico_#{record.tipo}").eql?(record)
  end

  # DELETE /cartorio/informacao/dutes/:id/sinal_publicos/:id
  def destroy?
    dute = record.dute

    user.grupo?(cartorio_rec_firma) &&
      user.entidade.eql?(dute.cartorio) &&
      record.id
  end
end
