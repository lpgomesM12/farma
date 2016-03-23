class Produtoorcamento < ActiveRecord::Base
  belongs_to :orcamento
  belongs_to :produto
end
