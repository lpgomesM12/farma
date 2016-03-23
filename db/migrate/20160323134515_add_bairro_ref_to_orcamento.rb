class AddBairroRefToOrcamento < ActiveRecord::Migration
  def change
    add_reference :orcamentos, :bairro, index: true, foreign_key: true
  end
end
