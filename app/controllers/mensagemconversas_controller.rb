class MensagemconversasController < ApplicationController
  before_action :set_mensagemconversa, only: [:show, :edit, :update, :destroy]

  # GET /mensagemconversas
  # GET /mensagemconversas.json
  def index
    @mensagemconversas = Mensagemconversa.all
  end

  # GET /mensagemconversas/1
  # GET /mensagemconversas/1.json
  def show
  end

  # GET /mensagemconversas/new
  def new
    @mensagemconversa = Mensagemconversa.new
  end

  # GET /mensagemconversas/1/edit
  def edit
  end

  # POST /mensagemconversas
  # POST /mensagemconversas.json
  def create
    @mensagemconversa = Mensagemconversa.new(mensagemconversa_params)

    respond_to do |format|
      if @mensagemconversa.save
        format.html { redirect_to @mensagemconversa, notice: 'Mensagemconversa was successfully created.' }
        format.json { render :show, status: :created, location: @mensagemconversa }
      else
        format.html { render :new }
        format.json { render json: @mensagemconversa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mensagemconversas/1
  # PATCH/PUT /mensagemconversas/1.json
  def update
    respond_to do |format|
      if @mensagemconversa.update(mensagemconversa_params)
        format.html { redirect_to @mensagemconversa, notice: 'Mensagemconversa was successfully updated.' }
        format.json { render :show, status: :ok, location: @mensagemconversa }
      else
        format.html { render :edit }
        format.json { render json: @mensagemconversa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mensagemconversas/1
  # DELETE /mensagemconversas/1.json
  def destroy
    @mensagemconversa.destroy
    respond_to do |format|
      format.html { redirect_to mensagemconversas_url, notice: 'Mensagemconversa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mensagemconversa
      @mensagemconversa = Mensagemconversa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mensagemconversa_params
      params.require(:mensagemconversa).permit(:mensgem, :flag_lida, :conversa_id, :user_id)
    end
end
