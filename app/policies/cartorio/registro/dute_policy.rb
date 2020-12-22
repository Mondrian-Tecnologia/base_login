# frozen_string_literal: true

# Regras de acesso para /cartorio/registro/dutes
# Cartorio: ["administrador", "financeiro", "rec_firma", "registro"]
class Cartorio::Registro::DutePolicy < CartorioPolicy
  # GET /cartorio/registro/dutes/:id/edit
  def edit?
    update?
  end

  # PATCH /cartorio/registro/dutes/:id
  def update?
    user.grupo?(cartorio_registro) &&
      user.entidade.eql?(record.rtd) &&
      (record.pendente_de_registro? || record.registrado?) &&
      record.imagem.present?
  end

  # GET /cartorio/registro/dutes/pendentes_de_registro
  def pendentes_de_registro?
    user.grupo?(cartorio_registro)
  end

  # GET /cartorio/registro/dutes/registrados
  def registrados?
    user.grupo?(cartorio_registro)
  end

  # POST /cartorio/registro/dutes/:id/solicitar_imagem
  def solicitar_imagem?
    user.grupo?(cartorio_registro) &&
      user.entidade.eql?(record.rtd) &&
      record.pendente_de_registro? &&
      !record.updated_at.today?
  end
end
