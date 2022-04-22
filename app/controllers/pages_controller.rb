class PagesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:home, :about]
  def home
    @user = current_user
    @atsb = AdminTransactionStockBuy.all
    @atss = AdminTransactionStockSell.all
  end

  def my_portfolio
    @user = current_user
    @stock = @user.stocks
  end

  def transaction
    @user = current_user 
    @transaction_deposit = @user.deposits
    @transaction_withdraw = @user.withdraws
    @transaction_stock_buys = @user.stock_buys
    @transaction_stock_sells = @user.stock_sells
    
  end

  def about
    
  end

  def create_user
    
  end

end
