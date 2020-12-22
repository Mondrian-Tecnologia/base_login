# frozen_string_literal: true

# Doc
class CpfCnpjValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return true unless value.present?
    return true if Cnpj.new(value).valido? || Cpf.new(value).valido?

    record.errors.add(attribute, :invalid)
  end
end
