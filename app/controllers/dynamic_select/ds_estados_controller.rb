# frozen_string_literal: true

# Doc
class DynamicSelect::DsEstadosController < ApplicationController
  respond_to :js
  after_action :verify_authorized, only: []
  after_action :verify_policy_scoped, only: []

  def show
    @estado  = Estado.find_by(uf: params[:id])
    @cidades = @estado.cidades.order(:nome).collect { |c| { id: c.cod, nome: c.nome } }
    render json: @cidades
  end
end
