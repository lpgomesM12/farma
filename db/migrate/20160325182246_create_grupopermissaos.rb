class CreateGrupopermissaos < ActiveRecord::Migration
  def change
    create_table :grupopermissaos do |t|
      t.string :nome
      t.text :descricao

      t.timestamps null: false
    end

    Grupopermissao.create(:nome => 'USERSITE', :descricao =>  'Usuários do site')
    Grupopermissao.create(:nome => 'USEREMPRESA', :descricao =>  'Usuários da farmacia')
    Grupopermissao.create(:nome => 'USERADMSITE', :descricao =>  'Usuários com permissão de administrador do site')

  end
end
