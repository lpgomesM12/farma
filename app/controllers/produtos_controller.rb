class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]

 
  def cadastrar_produto_orcamento
    @produtoorcamento = Produtoorcamento.new
    @produtoorcamento.orcamento_id = params[:orcamento_id]
    @produtoorcamento.produto_id = params[:produto_id]
    @produtoorcamento.save
    render :json => true
  end
   

  def carrega_produto_orcamento
    @produtoorcamentos = Produtoorcamento.where(orcamento_id: params[:orcamento_id])
    json_produtoorcamento = @produtoorcamentos.map { |item| {:id => item.id,
                                                             :nome => item.produto.nome}}
    render :json => json_produtoorcamento
  end

  
  def exclui_produto_orcamento
    @produtoorcamento = Produtoorcamento.find(params[:produtoorcamento_id])
    @produtoorcamento.destroy
    render :json => true
  end

  def busca_produto

  end

  # GET /produtos
  # GET /produtos.json
  def index
    @produtos = Produto.all
  end

  def search
     @results = Produto.search(params[:term]).limit(30)
  end

  def busca
     @results = Produto.search(params[:term]).limit(30)
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
  end

  # GET /produtos/1/edit
  def edit
  end


  # POST /produtos
  # POST /produtos.json
  def create_orcamento
    @produto = Produto.new(produto_params)

    respond_to do |format|
      if @produto.save
        format.html { redirect_to  edit_produto_path(@produto), notice: '' }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(produto_params)

    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, notice: 'Produto was successfully created.' }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produtos/1
  # PATCH/PUT /produtos/1.json
  def update
    respond_to do |format|
      if @produto.update(produto_params)
        format.html { redirect_to @produto, notice: 'Produto was successfully updated.' }
        format.json { render :show, status: :ok, location: @produto }
      else
        format.html { render :edit }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto.destroy
    respond_to do |format|
      format.html { redirect_to produtos_url, notice: 'Produto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produto_params
      params.require(:produto).permit(:nome, :principioativo, :laboratorio, :concentracao, :formafarmaceutica, :tipoproduto_id)
    end
end
