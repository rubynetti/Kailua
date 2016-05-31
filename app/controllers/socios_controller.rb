class SociosController < ApplicationController
  before_action :set_socio, only: [:show, :edit, :update, :destroy]

  # GET /socios
  def index
    @socios = Socio.all.order(:number)
  end

  # GET /socios/1
  def show
  end

  # GET /socios/new
  def new
    @socio = Socio.new
  end

  # GET /socios/1/edit
  def edit
  end

  # POST /socios
  def create
    @socio = Socio.new(socio_params)

    if @socio.save
      redirect_to socios_path, notice: 'Socio aggiunto.'
    else
      render :new
    end
  end

  # PATCH/PUT /socios/1
  def update
    if @socio.update(socio_params)
      redirect_to @socio, notice: 'Socio aggiornato.'
    else
      render :edit
    end
  end

  # DELETE /socios/1
  def destroy
    @socio.destroy
    redirect_to socios_url, notice: 'Socio cancellato.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socio
      @socio = Socio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socio_params
      params.require(:socio).permit(:name, 
                                    :surname, 
                                    :contact, 
                                    :cf, 
                                    :number, 
                                    :complete,
                                    :birthdate,
                                    :tel,
                                    :registration_date,
                                    :residence_place,
                                    :birth_place)
    end
end
