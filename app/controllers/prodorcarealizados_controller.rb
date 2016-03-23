class ProdorcarealizadosController < ApplicationController
  before_action :set_prodorcarealizado, only: [:show, :edit, :update, :destroy]

  # GET /prodorcarealizados
  # GET /prodorcarealizados.json
  def index
    @prodorcarealizados = Prodorcarealizado.all
  end

  # GET /prodorcarealizados/1
  # GET /prodorcarealizados/1.json
  def show
  end

  # GET /prodorcarealizados/new
  def new
    @prodorcarealizado = Prodorcarealizado.new
  end

  # GET /prodorcarealizados/1/edit
  def edit
  end

  # POST /prodorcarealizados
  # POST /prodorcarealizados.json
  def create
    @prodorcarealizado = Prodorcarealizado.new(prodorcarealizado_params)

    respond_to do |format|
      if @prodorcarealizado.save
        format.html { redirect_to @prodorcarealizado, notice: 'Prodorcarealizado was successfully created.' }
        format.json { render :show, status: :created, location: @prodorcarealizado }
      else
        format.html { render :new }
        format.json { render json: @prodorcarealizado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prodorcarealizados/1
  # PATCH/PUT /prodorcarealizados/1.json
  def update
    respond_to do |format|
      if @prodorcarealizado.update(prodorcarealizado_params)
        format.html { redirect_to @prodorcarealizado, notice: 'Prodorcarealizado was successfully updated.' }
        format.json { render :show, status: :ok, location: @prodorcarealizado }
      else
        format.html { render :edit }
        format.json { render json: @prodorcarealizado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prodorcarealizados/1
  # DELETE /prodorcarealizados/1.json
  def destroy
    @prodorcarealizado.destroy
    respond_to do |format|
      format.html { redirect_to prodorcarealizados_url, notice: 'Prodorcarealizado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prodorcarealizado
      @prodorcarealizado = Prodorcarealizado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prodorcarealizado_params
      params.require(:prodorcarealizado).permit(:valor, :valor_desconto, :valor_total, :porcentagemdesconto, :flag_produtoemfalta)
    end
end
