class Grupopermissaouser < ActiveRecord::Base
  belongs_to :user
  belongs_to :grupopermissao
end
