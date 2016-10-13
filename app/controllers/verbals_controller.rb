class VerbalsController < ApplicationController
  before_action :set_verbal, only: [:show, :edit, :update, :destroy]

  # GET /verbals
  def index
    @verbals = Verbal.all
    @verbals = Verbal.all.order("#{params[:sort]} #{params[:direction]}") if params[:sort].present?
  end

  # GET /verbals/1
  def show
  end

  # GET /verbals/new
  def new
    @verbal = Verbal.new
  end

  # GET /verbals/1/edit
  def edit
  end

  # POST /verbals
  def create
    @verbal = Verbal.new(verbal_params)

    if @verbal.save
      redirect_to @verbal, notice: 'Il verbale è stato salvato.'
    else
      render :new
    end
  end

  # PATCH/PUT /verbals/1
  def update
    if @verbal.update(verbal_params)
      redirect_to @verbal, notice: 'Il verbale è stato aggiornato.'
    else
      render :edit
    end
  end

  # DELETE /verbals/1
  def destroy
    @verbal.destroy
    redirect_to verbals_url, notice: 'Il verbale è stato eliminato.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_verbal
      @verbal = Verbal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def verbal_params
      params.require(:verbal).permit(:title, :content, :document_date)
    end
end
