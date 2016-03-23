class Orcamento < ActiveRecord::Base
  belongs_to :user
  belongs_to :situacaoorcamento
  belongs_to :bairro
  
end
