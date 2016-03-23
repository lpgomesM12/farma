class SituacaoorcamentosController < ApplicationController
  before_action :set_situacaoorcamento, only: [:show, :edit, :update, :destroy]

  # GET /situacaoorcamentos
  # GET /situacaoorcamentos.json
  def index
    @situacaoorcamentos = Situacaoorcamento.all
  end

  # GET /situacaoorcamentos/1
  # GET /situacaoorcamentos/1.json
  def show
  end

  # GET /situacaoorcamentos/new
  def new
    @situacaoorcamento = Situacaoorcamento.new
  end

  # GET /situacaoorcamentos/1/edit
  def edit
  end

  # POST /situacaoorcamentos
  # POST /situacaoorcamentos.json
  def create
    @situacaoorcamento = Situacaoorcamento.new(situacaoorcamento_params)

    respond_to do |format|
      if @situacaoorcamento.save
        format.html { redirect_to @situacaoorcamento, notice: 'Situacaoorcamento was successfully created.' }
        format.json { render :show, status: :created, location: @situacaoorcamento }
      else
        format.html { render :new }
        format.json { render json: @situacaoorcamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /situacaoorcamentos/1
  # PATCH/PUT /situacaoorcamentos/1.json
  def update
    respond_to do |format|
      if @situacaoorcamento.update(situacaoorcamento_params)
        format.html { redirect_to @situacaoorcamento, notice: 'Situacaoorcamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @situacaoorcamento }
      else
        format.html { render :edit }
        format.json { render json: @situacaoorcamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /situacaoorcamentos/1
  # DELETE /situacaoorcamentos/1.json
  def destroy
    @situacaoorcamento.destroy
    respond_to do |format|
      format.html { redirect_to situacaoorcamentos_url, notice: 'Situacaoorcamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_situacaoorcamento
      @situacaoorcamento = Situacaoorcamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def situacaoorcamento_params
      params.require(:situacaoorcamento).permit(:nome)
    end
end
