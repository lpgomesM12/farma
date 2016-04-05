class ConversasController < ApplicationController
  before_action :set_conversa, only: [:show, :edit, :update, :destroy]

 def create_conversa
    @conversa = Conversa.new
    @conversa.orcamentoempresa_id = params[:id]
    @conversa.user_id = current_user.id    

    respond_to do |format|
      if @conversa.save
        format.html { redirect_to @conversa, notice: '' }
        format.json { render :show, status: :created, location: @conversa }
      else
        format.html { render :new }
        format.json { render json: @conversa.errors, status: :unprocessable_entity }
      end
    end

 end

 def envia_mensagem
    @mensagemconversa = Mensagemconversa.new
    @mensagemconversa.mensgem = params[:mensagem]
    @mensagemconversa.conversa_id = params[:conversa_id]
    @mensagemconversa.user_id = params[:user_id]    
    @mensagemconversa.save

    render :json => true
  end
  
  def carrega_mensagens
     @mensagemconversa = Mensagemconversa.where(conversa_id: params[:conversa_id])
     json_mensagens = @mensagemconversa.map { |item| {:id => item.id,
                                                             :mensagem => item.mensgem,
                                                             :usuario => item.user.nome,
                                                             :data => item.created_at.strftime("%d %B %R"),
                                                             :user_id => item.user_id,
                                                             :usuariolocal => current_user.id}}
    render :json => json_mensagens
  
  end


  # GET /conversas
  # GET /conversas.json
  def index
    @conversas = Conversa.all
  end

  # GET /conversas/1
  # GET /conversas/1.json
  def show
  
    @falandoCom = current_user.empresa_id == 1 ? @conversa.orcamentoempresa.empresa.nome : @conversa.orcamentoempresa.orcamento.user.nome
  
  end

  # GET /conversas/new
  def new
    @conversa = Conversa.new
  end

  # GET /conversas/1/edit
  def edit
  end

  # POST /conversas
  # POST /conversas.json
  def create
    @conversa = Conversa.new(conversa_params)

    respond_to do |format|
      if @conversa.save
        format.html { redirect_to @conversa, notice: 'Conversa was successfully created.' }
        format.json { render :show, status: :created, location: @conversa }
      else
        format.html { render :new }
        format.json { render json: @conversa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversas/1
  # PATCH/PUT /conversas/1.json
  def update
    respond_to do |format|
      if @conversa.update(conversa_params)
        format.html { redirect_to @conversa, notice: 'Conversa was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversa }
      else
        format.html { render :edit }
        format.json { render json: @conversa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversas/1
  # DELETE /conversas/1.json
  def destroy
    @conversa.destroy
    respond_to do |format|
      format.html { redirect_to conversas_url, notice: 'Conversa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversa
      @conversa = Conversa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversa_params
      params.require(:conversa).permit(:orcamentoempresa_id, :user_id)
    end
end
