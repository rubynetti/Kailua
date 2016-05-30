class SocisController < ApplicationController
  before_action :set_soci, only: [:show, :edit, :update, :destroy]

  # GET /socis
  # GET /socis.json
  def index
    @socis = Soci.all
  end

  # GET /socis/1
  # GET /socis/1.json
  def show
  end

  # GET /socis/new
  def new
    @soci = Soci.new
  end

  # GET /socis/1/edit
  def edit
  end

  # POST /socis
  # POST /socis.json
  def create
    @soci = Soci.new(soci_params)

    respond_to do |format|
      if @soci.save
        format.html { redirect_to @soci, notice: 'Soci was successfully created.' }
        format.json { render :show, status: :created, location: @soci }
      else
        format.html { render :new }
        format.json { render json: @soci.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /socis/1
  # PATCH/PUT /socis/1.json
  def update
    respond_to do |format|
      if @soci.update(soci_params)
        format.html { redirect_to @soci, notice: 'Soci was successfully updated.' }
        format.json { render :show, status: :ok, location: @soci }
      else
        format.html { render :edit }
        format.json { render json: @soci.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /socis/1
  # DELETE /socis/1.json
  def destroy
    @soci.destroy
    respond_to do |format|
      format.html { redirect_to socis_url, notice: 'Soci was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soci
      @soci = Soci.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def soci_params
      params.require(:soci).permit(:nome, :cognome, :contatto, :cf, :numero_tessera, :da_rinnovare)
    end
end
