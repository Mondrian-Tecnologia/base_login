# frozen_string_literal: true

class CidadePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def create?
    true
  end

  def update?
    true
  end

  def recibo?
    true
  end

  def print_dutes?
    true
  end
end
