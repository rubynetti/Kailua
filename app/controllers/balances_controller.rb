class BalancesController < ApplicationController
  
  def index
    @balances = Balance.all
  end

  def show
    @balance = Balance.find params[:id]
  end

  def new
    @balance = Balance.new
  end

  def edit
    @balance = Balance.find params[:id]
  end

  def create
    @balance = Balance.new(balance_params)
    if @balance.save
      redirect_to @balance
    else
      render :edit
    end
  end

  def update
    @balance = Balance.find params[:id]
    if @balance.update (balance_params)
      redirect_to @balance
    else
      render :edit
    end
  end

  def balance_params
    params.require(:balance).permit(:name, :description, :start_date, :end_date)
  end

end