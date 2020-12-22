# frozen_string_literal: true

# Doc
class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return true unless value.present?
    return true if Cpf.new(value).valido?

    record.errors.add(attribute, :invalid)
  end
end
