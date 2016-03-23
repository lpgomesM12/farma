#encoding: utf-8
class DadosusersController < ApplicationController
  before_action :set_dadosuser, only: [:show, :edit, :update, :destroy]

  # GET /dadosusers
  # GET /dadosusers.json
  def index
    @dadosusers = Dadosuser.all
  end

  # GET /dadosusers/1
  # GET /dadosusers/1.json
  def show
  end

  # GET /dadosusers/new
  def new
    @dadosuser = Dadosuser.new
    @dadosuser.build_endereco
  end

  # GET /dadosusers/1/edit
  def edit
  end

  # POST /dadosusers
  # POST /dadosusers.json
  def create
    @dadosuser = Dadosuser.new(dadosuser_params)

    respond_to do |format|
      if @dadosuser.save
        format.html { redirect_to root_path, notice: 'Agora sim podemos começar!'} 
        
        format.json { render :show, status: :created, location: @dadosuser }
      else
        format.html { render :new }
        format.json { render json: @dadosuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dadosusers/1
  # PATCH/PUT /dadosusers/1.json
  def update
    respond_to do |format|
      if @dadosuser.update(dadosuser_params)
        format.html { redirect_to @dadosuser, notice: 'Dadosuser was successfully updated.' }
        format.json { render :show, status: :ok, location: @dadosuser }
      else
        format.html { render :edit }
        format.json { render json: @dadosuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dadosusers/1
  # DELETE /dadosusers/1.json
  def destroy
    @dadosuser.destroy
    respond_to do |format|
      format.html { redirect_to dadosusers_url, notice: 'Dadosuser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dadosuser
      @dadosuser = Dadosuser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dadosuser_params
      params.require(:dadosuser).permit(:user_id, endereco_attributes: [ :id, :endereco, :numero, :complemento, :cep, :latitude, :longitude, :bairro_id, :cidade_id])
    end
end
