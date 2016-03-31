class Orcamentorealizado < ActiveRecord::Base
  belongs_to :situacaoorcamento
  belongs_to :orcamentoempresa

  has_many :prodorcarealizado, dependent: :destroy

  def self.qtd_orcamento_realizado(orcamento)
    sql = " INNER JOIN orcamentoempresas orca ON orca.id = orcamentorealizados.orcamentoempresa_id "
    sql = sql + " WHERE "
    sql = sql + " orcamentorealizados.situacaoorcamento_id = 5 "
    sql = sql + " AND orca.orcamento_id = #{orcamento} "
    self.joins(sql)
  end

end
