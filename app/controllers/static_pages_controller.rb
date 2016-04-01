class StaticPagesController < ApplicationController
 
 def home

 
 Produto.copy_from "medicamento.csv"
 
  if user_signed_in?
    if !current_user.dadosuser
	 	@dadosuser = Dadosuser.new
	 	@dadosuser.build_endereco
    end
  end   
 end
end
