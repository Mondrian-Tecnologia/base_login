# frozen_string_literal: true

# metodo .filter todos models
module Filterable
  extend ActiveSupport::Concern

  # metodo de classe
  module ClassMethods
    def filter(filtering_params)
      results = where(nil)
      filtering_params.each do |key, value|
        results = results.public_send(key, value) if value.present?
      end
      results
    end
  end
end
