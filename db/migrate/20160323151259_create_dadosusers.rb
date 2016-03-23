class CreateDadosusers < ActiveRecord::Migration
  def change
    create_table :dadosusers do |t|
      t.references :user, index: true, foreign_key: true
      t.references :endereco, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
