class UsuarioController < ApplicationController
  
  def perfil
  end

  def gera_chaveacesso
  
  	@user = User.find(current_user.id)
    @user.chaveacesso = Time.new.nsec

    respond_to do |format|
      if @user.save
        format.html { redirect_to usuario_perfil_path, notice: '' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def valida_usuario
         @user = User.where(id: params[:user_id], chaveacesso: params[:chaveacesso])
         json_users = @user.map { |item| {:id => item.id,
                                                          :empresa_id => item.empresa_id}}
        render :json => json_users
  end

  def download_apk
    send_file "#{Rails.root}/app-release.apk"
  end


end
