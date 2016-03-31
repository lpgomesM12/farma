class AddLatlongToOrcamento < ActiveRecord::Migration
  def change
    add_column :orcamentos, :latitude, :string
    add_column :orcamentos, :longitude, :string
  end
end
