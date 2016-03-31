class CreateOrcamentorealizados < ActiveRecord::Migration
  def change
    create_table :orcamentorealizados do |t|
      t.decimal :valor_orcamento
      t.decimal :valor_desconto
      t.integer :porcentagemdesconto
      t.decimal :valor_total
      t.references :situacaoorcamento, index: true, foreign_key: true
      t.references :orcamentoempresa, index: true, foreign_key: true
      t.text :mensagem

      t.timestamps null: false
    end
  end
end
