class CreateOrcamentoempresas < ActiveRecord::Migration
  def change
    create_table :orcamentoempresas do |t|
      t.references :orcamento, index: true, foreign_key: true
      t.references :empresa, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
