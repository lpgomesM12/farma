class OrcamentoempresasController < ApplicationController
 before_action :set_orcamentoempresa, only: [:show, :edit, :update, :destroy]

  
 def orcamentorecebidos
  @orcamentorealizados = Orcamentorealizado.joins(:orcamentoempresa).where(situacaoorcamento_id: 4 ,orcamentoempresas: {empresa_id: current_user.empresa_id}) 
 end

  # GET /enderecos
  # GET /enderecos.json
  def index
    @orcamentoempresa  = Orcamentoempresa.busca(current_user.empresa_id).order(created_at: :desc)    
    #@orcamentoempresa  = Orcamentoempresa.where(empresa_id: current_user.empresa_id).order(created_at: :desc)
    # @orcamentoempresa  = Orcamentoempresa.joins(:orcamento).where(orcamentos: {user_id: current_user.id})    
  end

  # GET /enderecos/1
  # GET /enderecos/1.json
  def show
  end

  # GET /enderecos/new
  def new
    @orcamentoempresa = Orcamentoempresa.new
  end

  # GET /enderecos/1/edit
  def edit
  end
  
  # POST /enderecos
  # POST /enderecos.json
  def create
    @orcamentoempresa = Orcamentoempresa.new(orcamentoempresa_params)

    respond_to do |format|
      if @orcamentoempresa.save
        format.html { redirect_to @orcamentoempresa, notice: 'Endereco was successfully created.' }
        format.json { render :show, status: :created, location: @orcamentoempresa }
      else
        format.html { render :new }
        format.json { render json: @orcamentoempresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enderecos/1
  # PATCH/PUT /enderecos/1.json
  def update
    respond_to do |format|
      if @orcamentoempresa.update(orcamentoempresa_params)
        format.html { redirect_to @orcamentoempresa, notice: 'Endereco was successfully updated.' }
        format.json { render :show, status: :ok, location: @orcamentoempresa }
      else
        format.html { render :edit }
        format.json { render json: @orcamentoempresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enderecos/1
  # DELETE /enderecos/1.json
  def destroy
    @orcamentoempresa.destroy
    respond_to do |format|
      format.html { redirect_to orcamentoempresas_url, notice: 'Endereco was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orcamentoempresa
      @orcamentoempresa = Orcamentoempresa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orcamentoempresa_params
      params.require(:orcamentoempresa).permit(:orcamento_id, :empresa_id)
    end
end
