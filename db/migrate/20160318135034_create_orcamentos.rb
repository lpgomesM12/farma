class CreateOrcamentos < ActiveRecord::Migration
  def change
    create_table :orcamentos do |t|
      t.string :nome
      t.text :descricao
      t.string :situacao
      t.integer :codigoorcamento
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
