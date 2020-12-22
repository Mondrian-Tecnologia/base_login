# frozen_string_literal: true

# Excecoes do ApplicationController
module ExceptionsApplication
  extend ActiveSupport::Concern

  included do
    rescue_from ActionController::InvalidAuthenticityToken, with: :invalid_token
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from PG::RaiseException, with: :pg_raise
    rescue_from RuntimeError, with: :runtime_error
    rescue_from Pundit::NotAuthorizedError, with: :pundit_not_authorized

    def pundit_not_authorized(error)
      logger.info error
      flash[:error] = 'Seu usuário não possui acesso a essa ferramenta.'

      redirect_to(request.referrer || root_path)
    end

    def invalid_token
      redirect_back fallback_location: root_path, flash: { error: 'Invalid Token' }
    end

    def not_found
      redirect_back fallback_location: root_path, flash: { error: 'Registro não encontrado' }
    end

    def pg_raise(error)
      logger.info error
      redirect_back fallback_location: root_path, flash: { error: error }
    end

    def runtime_error(error)
      logger.info error
      redirect_back fallback_location: root_path, flash: { error: error }
    end

    def acesso_negado
      redirect_back fallback_location: root_path, flash: { error: 'Acesso Negado' }
    end
  end
end