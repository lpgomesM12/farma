class Mensagemconversa < ActiveRecord::Base
  belongs_to :conversa
  belongs_to :user

 
  def self.busca_conversa_empresa(empresa)
    sql = " INNER JOIN conversas co ON conversa_id = co.id "
    sql = sql + " INNER JOIN orcamentoempresas orc ON co.orcamentoempresa_id = orc.id "
    sql = sql + " WHERE "
    sql = sql + " orc.empresa_id = #{empresa} "
    sql = sql + " AND flag_lida = false		"
    sql = sql + " AND  (select empresa_id from users where id = mensagemconversas.user_id) <> #{empresa} "
    self.joins(sql)
  end

  def self.busca_conversa_usuario(user)
    sql = " INNER JOIN conversas co ON conversa_id = co.id "
    sql = sql + " WHERE "
    sql = sql + " co.user_id = #{user} "
    sql = sql + " AND  user_id <> #{user} "
    self.joins(sql)
  end

end
