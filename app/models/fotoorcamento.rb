class Fotoorcamento < ActiveRecord::Base
  belongs_to :orcamento

  has_attached_file :foto, :styles => { :medium => "1000x800", :thumb => "100x100>" }, default_url: "/images/normal/missing.png"

  #validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :foto, :content_type => %w(image/jpeg image/jpg image/png)

end
