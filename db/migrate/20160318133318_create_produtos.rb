class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :principioativo
      t.string :cnpj
      t.string :laboratorio
      t.string :codigoggrem
      t.string :registro
      t.string :codigobarra
      t.string :apresentacao
      t.string :classefarmaceutica
      t.string :restrihospitalar
      t.references :tipoproduto, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end


