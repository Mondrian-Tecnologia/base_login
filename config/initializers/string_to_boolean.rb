# frozen_string_literal: true

# String to boolean
class String
  def to_boolean
    ActiveRecord::Type::Boolean.new.cast(self)
  end
end
