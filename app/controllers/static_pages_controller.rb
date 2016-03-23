class StaticPagesController < ApplicationController
 
 def home
 	 
    if !current_user.dadosuser
	 	@dadosuser = Dadosuser.new
	 	@dadosuser.build_endereco
    end
    
 end

end
