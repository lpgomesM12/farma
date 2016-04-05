class CreateConversas < ActiveRecord::Migration
  def change
    create_table :conversas do |t|
      t.references :orcamentoempresa, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
