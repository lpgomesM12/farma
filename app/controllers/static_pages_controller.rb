class StaticPagesController < ApplicationController
 
 def home
 
  if user_signed_in?
    if !current_user.dadosuser
	 	@dadosuser = Dadosuser.new
	 	@dadosuser.build_endereco
    end
  end   
 end
end
