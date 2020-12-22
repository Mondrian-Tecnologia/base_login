# frozen_string_literal: true

# DeviseSessions
class Devise::SessionsController < DeviseController
  layout 'portal'
  respond_to :html, :js
  skip_after_action :verify_authorized

  prepend_before_action :require_no_authentication, only: %i[new create certisign]
  prepend_before_action :allow_params_authentication!, only: :create
  prepend_before_action :verify_signed_out_user, only: :destroy
  prepend_before_action(only: %i[create destroy]) { request.env['devise.skip_timeout'] = true }

  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    # set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  def destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    # set_flash_message! :notice, :signed_out if signed_out
    yield if block_given?
    respond_to_on_destroy
  end

  def certisign
    response = RubyCertisignLogin::Decrypt.new(params['cb'])
    unless response.is_a?(Hash)
      redirect_to new_usuario_session_path,
                  notice: 'Não foi possível detectar o certificado, verifique sua instalação e tente novamente.'
      return
    end

    unless RubyCertisignLogin.cert_valid?(response)
      redirect_to new_usuario_session_path, notice: 'Cerficado Vencido ou Inválido, verifique seu certificado.'
      return
    end

    usuario = Usuario.where(certisign_login: true, cpf_cnpj: response[:cpf].to_s + response[:cnpj].to_s).take
    if usuario
      self.resource = usuario
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      redirect_to new_usuario_session_path,
                  notice: 'Nenhum usuário associado ao certificado informado, contacte o adminsitrador do sistema.'
    end
  end

  def sign_in_with
    self.resource = resource_class.find(params[:id])
    if policy([:sindicato, resource]).logar_como?
      set_flash_message(:notice, :signed_in) if is_flashing_format?
      sign_in(resource_name, resource)
      redirect_to root_path
    else
      acesso_negado
    end
  end

  private

  def sign_in_params
    devise_parameter_sanitizer.sanitize(:sign_in)
  end

  def serialize_options(resource)
    methods = resource_class.authentication_keys.dup
    methods = methods.keys if methods.is_a?(Hash)
    methods << :password if resource.respond_to?(:password)
    { methods: methods, only: [:password] }
  end

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new" }
  end

  def translation_scope
    'devise.sessions'
  end

  def verify_signed_out_user
    return unless all_signed_out?

    set_flash_message! :notice, :already_signed_out
    respond_to_on_destroy
  end

  def all_signed_out?
    users = Devise.mappings.keys.map { |s| warden.user(scope: s, run_callbacks: false) }

    users.all?(&:blank?)
  end

  def respond_to_on_destroy
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name) }
    end
  end
end
