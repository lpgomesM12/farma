class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nome
      t.string :razaosocial
      t.string :cnpj
      t.string :informacao 
      t.references :endereco, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
