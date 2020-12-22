# frozen_string_literal: true

# Home
class HomeController < ApplicationController
  before_action :require_no_authentication
  skip_before_action :authenticate_usuario!
  after_action :verify_authorized, only: []
  after_action :verify_policy_scoped, only: []

  layout 'portal'

  def index
    # @mensagens = Mensagem.ativas.order(id: :desc)
  end

  private

  def require_no_authentication
    return unless current_usuario

    redirect_to after_sign_in_path_for(current_usuario)
  end
end


