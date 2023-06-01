class Usuario < ApplicationRecord
  self.table_name = 'usuarios'
  def self.authenticate(username, pdw)
    usuario = find_by(username: username, pdw: pdw)
    return usuario if usuario
    nil
  end
end
