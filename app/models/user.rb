class User < ActiveRecord::Base
  belongs_to :empresa
  
  has_many :grupopermissaouser, dependent: :destroy
  has_one :dadosuser

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  before_create :seta_empresa

  def seta_empresa
  	  if self.empresa_id.nil? or self.empresa_id == "" 
         self.empresa_id = 1 
  	  end
  end

  def tem_permissao(grupo) 
        @grupopermissao =  Grupopermissaouser.where(grupopermissao_id: grupo , user_id: self.id)
       
        @grupopermissao.empty? ? false : true 
 
  end
  
end
