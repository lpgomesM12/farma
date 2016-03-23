class CreateTipoprodutos < ActiveRecord::Migration
  def change
    create_table :tipoprodutos do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
