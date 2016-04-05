class CreateMensagemconversas < ActiveRecord::Migration
  def change
    create_table :mensagemconversas do |t|
      t.text :mensgem
      t.boolean :flag_lida
      t.references :conversa, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
