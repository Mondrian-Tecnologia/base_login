class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :lockable, :timeoutable, :registerable,
         :recoverable, authentication_keys: [:username]


  # DeviseLogin with portal field
  # nao remover self. (metodo de classe)
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:username)
      where(conditions.to_h).where(['lower(username) = :value', { value: login.downcase }]).first
    elsif !conditions.to_h.blank?
      where(conditions.to_h).first
    end
  end

end
