class SociosController < ApplicationController
  before_action :set_socio, only: [:show, :edit, :update, :destroy]

  # GET /socios
  def index
    @socios = Socio.all.order(:number)
    @socios = Socio.all.order("#{params[:sort]} #{params[:direction]}") if params[:sort].present?

    respond_to do |format|
      format.html
      format.csv { send_data @socios.to_csv, filename: 'soci.csv' }
      format.xls do
        if params[:pages]=="true"
          send_data @socios.to_csv(col_sep: ";"), filename: 'soci.xls'
        else
          send_data @socios.to_csv(col_sep: "\t"), filename: 'soci.xls'
        end
      end
    end
  end

  # GET /socios/1
  def show
  end

  # GET /socios/new
  def new
    @socio = Socio.new
    if Socio.last
      last_number, last_date = Socio.last.number, Socio.last.registration_date
      @socio.number = last_number + 1 if last_number
    end
    @socio.registration_date = last_date || Date.today
  end

  # GET /socios/1/edit
  def edit
  end

  # POST /socios
  def create
    @socio = Socio.new(socio_params)

    if @socio.save
      redirect_to new_socio_path, notice: t('.notice')
    else
      logger.warn @socio.errors.inspect
      render :new
    end
  end

  # PATCH/PUT /socios/1
  def update
    if @socio.update(socio_params)
      redirect_to @socio, notice: t('.notice')
    else
      render :edit
    end
  end

  # DELETE /socios/1
  def destroy
    @socio.destroy
    redirect_to socios_url, notice: t('.notice')
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
