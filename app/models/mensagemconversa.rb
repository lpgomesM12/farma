class Mensagemconversa < ActiveRecord::Base
  belongs_to :conversa
  belongs_to :user
end
