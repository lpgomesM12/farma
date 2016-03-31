class Prodorcarealizado < ActiveRecord::Base
  belongs_to :orcamentorealizado
  belongs_to :produto
end
