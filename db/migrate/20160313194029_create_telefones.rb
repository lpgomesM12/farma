class CreateTelefones < ActiveRecord::Migration
  def change
    create_table :telefones do |t|
      t.string :tipo
      t.string :numero
      t.references :empresa, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
