#encoding: utf-8
class OrcamentosController < ApplicationController
  before_action :set_orcamento, only: [:show, :edit, :update, :destroy]

  
 def showorcamentorealizado
   @orcamentorealizado = Orcamentorealizado.find(params[:id])
 end

  # GET /orcamentos
  # GET /orcamentos.json
  def index
    @orcamentos = Orcamento.where(user_id: current_user.id).order(created_at: :desc) 
  end

  # GET /orcamentos/1
  # GET /orcamentos/1.json
  def show      
      @orcamento
      @Orcamentorealizados = Orcamentorealizado.joins(:orcamentoempresa).where(situacaoorcamento_id: 5, orcamentoempresas: {orcamento_id: @orcamento.id}).order(created_at: :desc) 
  end

  # GET /orcamentos/new
  def new
    @orcamento = Orcamento.new
    @orcamento.fotoorcamento.build
  end

  # GET /orcamentos/1/edit
  def edit
  end

  # POST /orcamentos
  # POST /orcamentos.json
  def create
    @orcamento = Orcamento.new(orcamento_params)

    respond_to do |format|
      if @orcamento.save
        format.html { redirect_to @orcamento, notice: 'Orcamento was successfully created.' }
        format.json { render :show, status: :created, location: @orcamento }
      else
        format.html { render :new }
        format.json { render json: @orcamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /orcamentos
  # POST /orcamentos.json
  def create_orcamento
    
    @condigo = Orcamento.where(user_id: current_user.id).maximum(:codigoorcamento) 
    @orcamento = Orcamento.new
    
    if @condigo 
       @condigo += 1 
       @orcamento.codigoorcamento = @condigo              
     else
       @orcamento.codigoorcamento = 1 
     end   

    @orcamento.situacaoorcamento_id = 1
    @orcamento.nome =  "Orçamento " + @orcamento.codigoorcamento.to_s
    @orcamento.user_id = current_user.id

    @orcamento.bairro_id = current_user.dadosuser.endereco.bairro_id
    @orcamento.latitude = current_user.dadosuser.endereco.latitude
    @orcamento.longitude = current_user.dadosuser.endereco.longitude

    respond_to do |format|
      if @orcamento.save
        format.html { redirect_to edit_orcamento_path(@orcamento), notice: 'Cadastro realizado.' }
        format.json { render :show, status: :created, location: @orcamento }
      else
        format.html { render :new }
        format.json { render json: @orcamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orcamentos/1
  # PATCH/PUT /orcamentos/1.json
  def update
    respond_to do |format|
      if @orcamento.update(orcamento_params)

        # Chama metodo para disponibilizar orçamento para empresas
        seta_orcamento_empresas(@orcamento)
    
        format.html { redirect_to orcamentos_path, notice: 'Seu orçamento já foi enviado para as farmácias próximas de você. Aguarde o retorno!' }
        format.json { render :show, status: :ok, location: @orcamento }
      else
        format.html { render :edit }
        format.json { render json: @orcamento.errors, status: :unprocessable_entity }
      end
    end
  end

#Busca todas as empresas do raio de 10 Km e disponibiliza o orçamento para elas.
def seta_orcamento_empresas(orcamento)
  @empresas =  Empresa.busca_lat_long(orcamento.latitude,orcamento.longitude)

       @Orcamentoempresas = []

        @empresas.each do |empresa|          
           @orcamentoempresa = Orcamentoempresa.new
           @orcamentoempresa.orcamento_id = orcamento.id
           @orcamentoempresa.empresa_id = empresa.id       
          @Orcamentoempresas << @orcamentoempresa        
        end

    ActiveRecord::Base.transaction do
        success = @Orcamentoempresas.map(&:save)
            unless success.all?
              errored = a.select{|b| !b.errors.blank?}
              # do something with the errored values
              raise ActiveRecord::Rollback
            end
      end
    end

  # DELETE /orcamentos/1
  # DELETE /orcamentos/1.json
  def destroy
    @orcamento.destroy
    respond_to do |format|
      format.html { redirect_to orcamentos_url, notice: 'Orcamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orcamento
      @orcamento = Orcamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orcamento_params
      params.require(:orcamento).permit(:nome, :descricao, :user_id, :codigoorcamento, :situacaoorcamento_id, :bairro_id, :latitude, :longitude ,fotoorcamento_attributes: [:id, :_destroy, :foto])
    end
end
