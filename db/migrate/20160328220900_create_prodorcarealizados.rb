class CreateProdorcarealizados < ActiveRecord::Migration
  def change
    create_table :prodorcarealizados do |t|
      t.decimal :valor_produto
      t.decimal :valor_desconto
      t.decimal :valor_total
      t.integer :porcentagemdesconto
      t.boolean :flag_produtoemfalta
      t.references :orcamentorealizado, index: true, foreign_key: true
      t.references :produto, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
