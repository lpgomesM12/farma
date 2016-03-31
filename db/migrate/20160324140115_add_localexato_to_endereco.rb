class AddLocalexatoToEndereco < ActiveRecord::Migration
  def change
    add_column :enderecos, :flag_localexato, :boolean
  end
end
