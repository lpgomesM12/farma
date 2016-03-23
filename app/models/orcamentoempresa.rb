class Orcamentoempresa < ActiveRecord::Base
  belongs_to :orcamento
  belongs_to :empresa
end
