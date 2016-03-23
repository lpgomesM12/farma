class AddSitorcamentoRefToOrcamento < ActiveRecord::Migration
  def change
    add_reference :orcamentos, :situacaoorcamento, index: true, foreign_key: true
  end
end
