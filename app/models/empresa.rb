class Empresa < ActiveRecord::Base
  belongs_to :endereco, dependent: :destroy
  has_many :telefones, dependent: :destroy
  accepts_nested_attributes_for :endereco, allow_destroy: true
  accepts_nested_attributes_for :telefones, allow_destroy: true
  
  validates :nome, presence: true

  TIPOTELEFONE = %w[FIXO CELULAR]

end
