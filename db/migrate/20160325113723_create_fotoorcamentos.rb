class CreateFotoorcamentos < ActiveRecord::Migration
  def change
    create_table :fotoorcamentos do |t|
      t.references :orcamento, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
