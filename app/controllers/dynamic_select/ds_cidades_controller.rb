# frozen_string_literal: true

# Doc
class DynamicSelect::DsCidadesController < ApplicationController
  respond_to :json
  after_action :verify_authorized, only: []
  after_action :verify_policy_scoped, only: []

  def cartorios
    @cidade    = Cidade.find(params[:id])
    @cartorios = @cidade.cartorios.collect { |c| { id: c.id, nome: c.oficio } }
    render json: @cartorios
  end
end
