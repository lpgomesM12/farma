class CreateProdorcarealizados < ActiveRecord::Migration
  def change
    create_table :prodorcarealizados do |t|
      t.decimal :valor
      t.decimal :valor_desconto
      t.decimal :valor_total
      t.integer :porcentagemdesconto
      t.boolean :flag_produtoemfalta

      t.timestamps null: false
    end
  end
end
