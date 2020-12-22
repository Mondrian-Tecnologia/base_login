# frozen_string_literal: true

# DOC
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include Filterable

  # connects_to database: { writing: :primary, reading: :replica }
end

