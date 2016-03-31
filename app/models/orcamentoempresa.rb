class Orcamentoempresa < ActiveRecord::Base
  belongs_to :orcamento
  belongs_to :empresa

  def self.busca(empresa)
    sql = " LEFT OUTER JOIN orcamentorealizados orca ON orca.orcamentoempresa_id = orcamentoempresas.id "
    sql = sql + " WHERE "
    sql = sql + " orcamentoempresas.empresa_id = #{empresa} "
    sql = sql + " AND orca.orcamentoempresa_id IS NULL "
    self.joins(sql)
  end
end
