class CreateProdutoorcamentos < ActiveRecord::Migration
  def change
    create_table :produtoorcamentos do |t|
      t.references :orcamento, index: true, foreign_key: true
      t.references :produto, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
