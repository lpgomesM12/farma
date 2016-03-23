#encoding: utf-8
class OrcamentosController < ApplicationController
  before_action :set_orcamento, only: [:show, :edit, :update, :destroy]

  # GET /orcamentos
  # GET /orcamentos.json
  def index
    @orcamentos = Orcamento.all
  end

  # GET /orcamentos/1
  # GET /orcamentos/1.json
  def show
  end

  # GET /orcamentos/new
  def new
    @orcamento = Orcamento.new
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

        format.html { redirect_to @orcamentos_path, notice: 'Orcamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @orcamento }
      else
        format.html { render :edit }
        format.json { render json: @orcamento.errors, status: :unprocessable_entity }
      end
    end
  end

  def enviar_orcamento_empresas
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
      params.require(:orcamento).permit(:nome, :descricao, :user_id, :codigoorcamento, :situacaoorcamento_id, :bairro_id)
    end
end
