# frozen_string_literal: true

# Regras de acesso para /home
class HomePolicy < Struct.new(:user, :home)
  def index?
    true
  end

  def ferramentas?
    user.cartorio? || user.sindicato?
  end

  def servicos?
    user.sindicato?
  end
end
