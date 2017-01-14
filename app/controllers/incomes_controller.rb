class IncomesController < ApplicationController
  before_action :set_income, only: [:show, :edit, :update, :destroy]

  # GET /incomes
  def index
    @incomes = Income.all
    respond_to do |format|
      format.html
      format.csv { send_data @incomes.to_csv, filename: 'entrate.csv' }
      format.xls { send_data @incomes.to_csv(col_sep: "\t"), filename: 'entrate.xls'}
    end
  end

  # GET /incomes/1
  def show
  end

  # GET /incomes/new
  def new
    @income = Income.new
  end

  # GET /incomes/1/edit
  def edit
  end

  # POST /incomes
  def create
    @income = Income.new(income_params)

    if @income.save
      redirect_to incomes_path, notice: 'Entrata aggiunta.'
    else
      render :new
    end
  end

  # PATCH/PUT /incomes/1
  def update
    if @income.update(income_params)
      redirect_to incomes_path, notice: 'Entrata aggiornata.'
    else
      render :edit
    end
  end

  # DELETE /incomes/1
  def destroy
    @income.destroy
    redirect_to incomes_url, notice: 'Entrata cancellata.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income
      @income = Income.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def income_params
      params.require(:income).permit(:description, :price, :date_of_transaction, :category_id)
    end
end
