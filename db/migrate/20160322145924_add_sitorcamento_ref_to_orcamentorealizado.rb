class AddSitorcamentoRefToOrcamentorealizado < ActiveRecord::Migration
  def change
    add_reference :orcamentorealizados, :situacaoorcamento, index: true, foreign_key: true
  end
end
