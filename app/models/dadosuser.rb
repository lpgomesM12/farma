class Dadosuser < ActiveRecord::Base
  belongs_to :user
  belongs_to :endereco, dependent: :destroy

  accepts_nested_attributes_for :endereco, allow_destroy: true

end
