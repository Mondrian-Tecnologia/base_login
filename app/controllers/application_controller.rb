# frozen_string_literal: true

# ApplicationController
## before_action :authenticate_usuario!
## after_action :verify_authorized, except: :index
## after_action :verify_policy_scoped, only: :index
class ApplicationController < ActionController::Base
  # include Pundit
  include ExceptionsApplication
  include PunditMethods

  before_action :authenticate_usuario!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :set_current_entidade

  def user_for_paper_trail
    logged_in? ? current_usuario.id : nil
  end

  def set_current_entidade
    @current_entidade = current_usuario&.entidade
  end

  protected

  #   Protected
  def namespace
    controller_name_segments = params[:controller].split('/')
    controller_name_segments.pop
    controller_name_segments.join('/').camelize
  end

  def set_namespace
    @namespace = namespace
  end

  # Override method in devise user (forms -> create, edit_account)
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[login username password])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username email password password_confirmation])
  end

  def validar_datas
    campos = %i[data_inicial data_final vencimento]
    campos.each do |c|
      next unless params[c].present?

      Date.parse(params[c])
    end
  rescue StandardError
    redirect_back fallback_location: root_path, flash: { error: 'Verifique se todas as datas são válidas.' }
  end
end
