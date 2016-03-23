class TipoprodutosController < ApplicationController
  before_action :set_tipoproduto, only: [:show, :edit, :update, :destroy]

  # GET /tipoprodutos
  # GET /tipoprodutos.json
  def index
    @tipoprodutos = Tipoproduto.all
  end

  # GET /tipoprodutos/1
  # GET /tipoprodutos/1.json
  def show
  end

  # GET /tipoprodutos/new
  def new
    @tipoproduto = Tipoproduto.new
  end

  # GET /tipoprodutos/1/edit
  def edit
  end

  # POST /tipoprodutos
  # POST /tipoprodutos.json
  def create
    @tipoproduto = Tipoproduto.new(tipoproduto_params)

    respond_to do |format|
      if @tipoproduto.save
        format.html { redirect_to @tipoproduto, notice: 'Tipoproduto was successfully created.' }
        format.json { render :show, status: :created, location: @tipoproduto }
      else
        format.html { render :new }
        format.json { render json: @tipoproduto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipoprodutos/1
  # PATCH/PUT /tipoprodutos/1.json
  def update
    respond_to do |format|
      if @tipoproduto.update(tipoproduto_params)
        format.html { redirect_to @tipoproduto, notice: 'Tipoproduto was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipoproduto }
      else
        format.html { render :edit }
        format.json { render json: @tipoproduto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipoprodutos/1
  # DELETE /tipoprodutos/1.json
  def destroy
    @tipoproduto.destroy
    respond_to do |format|
      format.html { redirect_to tipoprodutos_url, notice: 'Tipoproduto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipoproduto
      @tipoproduto = Tipoproduto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipoproduto_params
      params.require(:tipoproduto).permit(:nome)
    end
end
