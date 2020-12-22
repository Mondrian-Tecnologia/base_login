# frozen_string_literal: true

# Excecoes do ApplicationController
module NotAuthenticateController
  extend ActiveSupport::Concern

  included do
    before_action :require_no_authentication, except: %i[imagem pdf]
    skip_before_action :authenticate_usuario!, except: %i[imagem pdf]
    after_action :verify_authorized, only: []
    after_action :verify_policy_scoped, only: []

    def require_no_authentication
      return unless current_usuario

      redirect_to after_sign_in_path_for(current_usuario)
    end
  end
end


# rescue_from Pundit::NotAuthorizedError do |exception|
#   # policy = exception.policy
#   # policy_name = policy.class.to_s.underscore.gsub('/', '.')
#   # error_key = policy.try(:error_message_key) ? policy.error_message_key : exception.query

#   # flash[:error] = t "#{policy_name}.#{error_key}", scope: 'pundit', default: :default
#   flash[:error] = 'Seu usuario não possui acesso a essa ferramenta.'
#   redirect_to(request.referrer || root_path)
# end
