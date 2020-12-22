# frozen_string_literal: true

# Regras de acesso para /cartorio/home
class Cartorio::HomePolicy < Struct.new(:user, :home)
  def index?
    user.cartorio?
  end

  def ferramentas?
    user.cartorio?
  end
end
