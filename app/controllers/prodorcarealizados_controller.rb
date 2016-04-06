class ProdorcarealizadosController < ApplicationController
  before_action :set_prodorcarealizado, only: [:show, :edit, :update, :destroy]


   include ActionView::Helpers::NumberHelper

   def cadastrar_produto_realizado
    @valor_total = params[:valor_total] 
    @valor_total = @valor_total.gsub('.', '')
    @valor_total = @valor_total.gsub(',', '.').to_f 

    @prodorcarealizados = Prodorcarealizado.new
    @prodorcarealizados.orcamentorealizado_id = params[:orcamentorealizado_id]
    @prodorcarealizados.produto_id = params[:produto_id]
    @prodorcarealizados.flag_produtoemfalta = params[:flag_produtoemfalta]
    @prodorcarealizados.flag_referencia = params[:flag_referencia]
    @prodorcarealizados.flag_generico = params[:flag_generico]
    @prodorcarealizados.flag_similar = params[:flag_similar]
    @prodorcarealizados.valor_total = @valor_total
    @prodorcarealizados.save
    render :json => true
   end

  def carrega_produto_realizado
    @prodorcarealizados = Prodorcarealizado.where(orcamentorealizado_id: params[:orcamentorealizado_id])

    @valor_totalGeral = @prodorcarealizados.map(&:valor_total).inject(0, &:+)
    json_prodorcarealizado = @prodorcarealizados.map { |item| {:id => item.id,
                                                             :nome => item.produto.nome,
                                                             :apresentacao => item.produto.apresentacao,
                                                             :flag_produtoemfalta => item.flag_produtoemfalta,
                                                             :flag_referencia => item.flag_referencia,
                                                             :flag_generico => item.flag_generico,
                                                             :flag_similar => item.flag_similar,
                                                             :valor_total => number_to_currency(item.valor_total, unit: "R$", separator: ",", delimiter: ""),
                                                             :valor_totalgeral => number_to_currency(@valor_totalGeral, unit: "", separator: ",", delimiter: "")}}
    render :json => json_prodorcarealizado
  end



  def exclui_produto_realizado
    @prodorcarealizado = Prodorcarealizado.find(params[:prodorcarealizado])
    @prodorcarealizado.destroy
    render :json => true
  end
   
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
      params.require(:prodorcarealizado).permit(:valor_produto, :valor_desconto, :valor_total, :porcentagemdesconto, :flag_produtoemfalta, :orcamentorealizado_id, :produto_id)
    end
end
