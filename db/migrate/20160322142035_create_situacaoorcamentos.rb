class CreateSituacaoorcamentos < ActiveRecord::Migration
  def change
    create_table :situacaoorcamentos do |t|
      t.string :nome

      t.timestamps null: false
    end

    Situacaoorcamento.create(:nome => 'Criado')
    Situacaoorcamento.create(:nome => 'Salvo')
    Situacaoorcamento.create(:nome => 'Enviado')
    Situacaoorcamento.create(:nome => 'Recebido')
    Situacaoorcamento.create(:nome => 'Realizado')

  end
end
