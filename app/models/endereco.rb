class Endereco < ActiveRecord::Base
  belongs_to :bairro
  belongs_to :cidade


  before_create :seta_localidade

  private
    def seta_localidade
     if (self.latitude.nil? or self.latitude == "" ) && (self.longitude.nil? or self.longitude == "")
        if !self.bairro_id.nil? 
         @bairro = Bairro.find(self.bairro_id)
         self.longitude = @bairro.longitude
         self.latitude =  @bairro.latitude 
       end       
     end
    end

end
