class AddCamposToProdorcarealizado < ActiveRecord::Migration
  def change
    add_column :prodorcarealizados, :flag_referencia, :boolean
    add_column :prodorcarealizados, :flag_generico, :boolean
    add_column :prodorcarealizados, :flag_similar, :boolean
  end
end
