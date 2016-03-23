class OrcamentorealizadosController < ApplicationController
  before_action :set_orcamentorealizado, only: [:show, :edit, :update, :destroy]

  # GET /orcamentorealizados
  # GET /orcamentorealizados.json
  def index
    @orcamentorealizados = Orcamentorealizado.all
  end

  # GET /orcamentorealizados/1
  # GET /orcamentorealizados/1.json
  def show
  end

  # GET /orcamentorealizados/new
  def new
    @orcamentorealizado = Orcamentorealizado.new
  end

  # GET /orcamentorealizados/1/edit
  def edit
  end

  # POST /orcamentorealizados
  # POST /orcamentorealizados.json
  def create
    @orcamentorealizado = Orcamentorealizado.new(orcamentorealizado_params)

    respond_to do |format|
      if @orcamentorealizado.save
        format.html { redirect_to @orcamentorealizado, notice: 'Orcamentorealizado was successfully created.' }
        format.json { render :show, status: :created, location: @orcamentorealizado }
      else
        format.html { render :new }
        format.json { render json: @orcamentorealizado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orcamentorealizados/1
  # PATCH/PUT /orcamentorealizados/1.json
  def update
    respond_to do |format|
      if @orcamentorealizado.update(orcamentorealizado_params)
        format.html { redirect_to @orcamentorealizado, notice: 'Orcamentorealizado was successfully updated.' }
        format.json { render :show, status: :ok, location: @orcamentorealizado }
      else
        format.html { render :edit }
        format.json { render json: @orcamentorealizado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orcamentorealizados/1
  # DELETE /orcamentorealizados/1.json
  def destroy
    @orcamentorealizado.destroy
    respond_to do |format|
      format.html { redirect_to orcamentorealizados_url, notice: 'Orcamentorealizado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orcamentorealizado
      @orcamentorealizado = Orcamentorealizado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orcamentorealizado_params
      params.require(:orcamentorealizado).permit(:valor_orcamento, :valor_desconto, :porcentagemdesconto, :valor_total, :mensagem)
    end
end
