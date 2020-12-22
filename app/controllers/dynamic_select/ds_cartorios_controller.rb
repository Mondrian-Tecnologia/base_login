# frozen_string_literal: true

# Doc
module DynamicSelect
  # Doc
  class DsCartoriosController < ApplicationController
    respond_to :json
    after_action :verify_authorized, only: []
    after_action :verify_policy_scoped, only: []

    def index
      @cartorios = Cartorio.where(domicilio_id: params[:id])
                           .order(:oficio)
                           .collect { |c| { id: c.id, nome: c.oficio } }
      render json: @cartorios
    end

    def rtd
      @cartorios = Cartorio.rtd
                           .where(domicilio_id: params[:id])
                           .order(:oficio)
                           .collect { |c| { id: c.id, nome: c.oficio } }
      render json: @cartorios
    end
  end
end
