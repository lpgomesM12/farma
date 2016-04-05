class Produto < ActiveRecord::Base
  belongs_to :tipoproduto

  acts_as_copy_target


 def self.search(term)
    where("lower(nome)like ?", "%#{term.downcase}%")
 end

end
