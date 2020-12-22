class Cidade < ApplicationRecord
  belongs_to :estado, required: true

  validates :cod, presence: true, uniqueness: true
  validates :descricao, presence: true

  delegate :uf, to: :estado
end
