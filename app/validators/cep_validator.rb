# frozen_string_literal: true

# Doc
class CepValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return true unless value.present?
    return true unless value !~ /^[0-9]{5}-[0-9]{3}$/

    record.errors.add(attribute, :invalid)
  end
end
