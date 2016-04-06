class AddCamposToOrcamento < ActiveRecord::Migration
  def change
    add_column :orcamentos, :formapagamento, :string
    add_column :orcamentos, :flag_referencia, :boolean
    add_column :orcamentos, :flag_generico, :boolean
    add_column :orcamentos, :flag_similar, :boolean
  end
end
