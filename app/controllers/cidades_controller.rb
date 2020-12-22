class CidadesController < ApplicationController
  before_action :set_cidade, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  # GET /cidades
  # GET /cidades.json
  def index
    authorize Cidade
    @cidades = Cidade.includes(:estado).order(id: :desc).page(params[:page])
  end

  # GET /cidades/1
  # GET /cidades/1.json
  def show
  end

  # GET /cidades/new
  def new
    authorize Cidade
    @cidade = Cidade.new
  end

  # GET /cidades/1/edit
  def edit
  end

  # POST /cidades
  # POST /cidades.json
  def create
    authorize Cidade
    @cidade = Cidade.new(cidade_params)

    respond_to do |format|
      if @cidade.save
        format.html { redirect_to @cidade, notice: 'Cidade was successfully created.' }
        format.json { render :show, status: :created, location: @cidade }
      else
        format.html { render :new }
        format.json { render json: @cidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cidades/1
  # PATCH/PUT /cidades/1.json
  def update
    respond_to do |format|
      if @cidade.update(cidade_params)
        format.html { redirect_to @cidade, notice: 'Cidade was successfully updated.' }
        format.json { render :show, status: :ok, location: @cidade }
      else
        format.html { render :edit }
        format.json { render json: @cidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cidades/1
  # DELETE /cidades/1.json
  def destroy
    @cidade.destroy
    respond_to do |format|
      format.html { redirect_to cidades_url, notice: 'Cidade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cidade
      @cidade = Cidade.find(params[:id])
      authorize @cidade
    end

    # Only allow a list of trusted parameters through.
    def cidade_params
      params.require(:cidade).permit(:cod, :descricao, :estado_id)
    end
end
