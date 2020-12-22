# frozen_string_literal: true

# Acesso inicial ao Modulo de Cartorio.
class CartorioController < ApplicationController
  before_action :validar_acesso
  before_action :pendencia_imagem_dutes

  def validar_acesso
    acesso_negado unless current_usuario.cartorio?
  end

  def current_entidade
    @current_entidade
  end

  def pendencia_imagem_dutes
    return if action_name.eql?('informar_imagem')
    return if action_name.eql?('salvar_imagem')

    dute = current_usuario.dutes.pendente_de_registro.where(imagem_file_name: nil).last

    return unless dute

    redirect_to informar_imagem_cartorio_informacao_dute_path(dute),
                flash: { error: "Informe a imagem do DUTe antes de realizar outras operações. [#{action_name}]"  }
  end
end