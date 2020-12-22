# frozen_string_literal: true

# Tratar Parametros do Cartorio::DutesController
module DuteTratarParamsController
  extend ActiveSupport::Concern

  def tratar_params_veiculo
    return unless params.has_key?(:dute)

    dute = params[:dute]
    params[:dute][:placa]   = dute[:placa].to_s.upcase.gsub(/[^A-Z0-9]/, '')    if dute.has_key?(:placa)
    params[:dute][:crv]     = dute[:crv].to_s.gsub(/\D/, '').rjust(12, '0')     if dute.has_key?(:crv)
    params[:dute][:renavam] = dute[:renavam].to_s.gsub(/\D/, '').rjust(11, '0') if dute.has_key?(:renavam)
    params[:dute][:cpf_vendedor] = dute[:cpf_vendedor].to_s.gsub(/\D/, '')      if dute.has_key?(:cpf_vendedor)
  end

  def tratar_params
    return unless params.has_key?(:dute)

    dute = params[:dute]
    params[:dute][:cepend]        = dute[:cepend].gsub(/[^0-9]/, '')        if dute.has_key?(:cepend)
    params[:dute][:comprador_cep] = dute[:comprador_cep].gsub(/[^0-9]/, '') if dute.has_key?(:comprador_cep)
    params[:dute][:valor_compra]  = dute[:valor_compra].to_s.gsub('.', '').gsub(',', '.').to_f if dute.has_key?(:valor_compra)
  end
end
