class CreateOrcamentorealizados < ActiveRecord::Migration
  def change
    create_table :orcamentorealizados do |t|
      t.decimal :valor_orcamento
      t.decimal :valor_desconto
      t.integer :porcentagemdesconto
      t.decimal :valor_total
      t.text :mensagem

      t.timestamps null: false
    end
  end
end
