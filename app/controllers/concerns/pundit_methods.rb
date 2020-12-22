# frozen_string_literal: true

# Adicionar os metodos referente ao Pundit
# Utilizado no Application e na Api
module PunditMethods
  extend ActiveSupport::Concern

  included do
    before_action :verify_authenticity_token, if: -> { request.format.json? }

    after_action :verify_authorized, except: :index
    after_action :verify_policy_scoped, only: :index

    def controller_namespace
      @controller_namespace ||= self.class.to_s.sub(/::[A-z]*Controller/, '')
    end

    def pundit_user
      current_usuario || @current_usuario
    end

    def authorize(record, query = nil)
      record = record.is_a?(Array) ? record.last : record
      scoped = record.class.eql?(Class) ? true : false

      logger.info controller_namespace
      klass = if %w[VeiculosController CidadesController].include?(controller_namespace)
                "#{record.model_name}Policy".constantize
              elsif record.eql?(:home)
                "#{controller_namespace}::HomePolicy".constantize
              else
                "#{controller_namespace}::#{record.model_name}Policy".constantize
              end
      policy = klass.new(pundit_user, record)
      query ||= "#{params[:action]}?"

      @_policy_authorized = true

      unless policy.public_send(query)
        # excecao para quando authorize nao foi criado
        raise Pundit::NotAuthorizedError, query: query, record: record, policy: policy
      end

      @_pundit_policy_authorized = !scoped
      @_pundit_policy_scoped = scoped

      true
    end
  end
end
