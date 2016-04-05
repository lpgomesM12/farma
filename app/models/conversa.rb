	class Conversa < ActiveRecord::Base
  belongs_to :orcamentoempresa
  belongs_to :user
end
