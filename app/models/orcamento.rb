class Orcamento < ActiveRecord::Base
  belongs_to :user
  belongs_to :situacaoorcamento
  belongs_to :bairro
  
  has_many :produtoorcamento, dependent: :destroy
  has_many :fotoorcamento, dependent: :destroy
  accepts_nested_attributes_for :fotoorcamento, allow_destroy: true, :reject_if => lambda { |t| t['foto'].nil? }

end
