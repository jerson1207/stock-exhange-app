class UserStocksController < ApplicationController

  def create
    stock = Stock.check_record(params[:ticker])
    if stock.blank?
      stock = Stock.search_for(params[:ticker])
      stock.save  
    end
    if current_user.cash > stock.last_price
      @user_stock = UserStock.create(user: current_user, stock: stock)
      stock_buy = StockBuy.new(ticker: stock.ticker, name: stock.name, last_price: stock.last_price )
      if stock_buy.save
        current_user.cash = current_user.cash - stock.last_price
        current_user.save
        TransactionStockBuy.create(user_id: current_user.id, stock_buy_id: stock_buy.id)
        AdminTransactionStockBuy.create(user_id: current_user.id, stock_buy_id: stock_buy.id)
        flash[:notice] = "Purchase successful"
        redirect_to my_portfolio_path
      end
    else
      flash[:notice] = "Not enough cash"
      redirect_to root_path
    end


   
    
  end

  def destroy
    stock = Stock.find(params[:id])
    stock_sell = StockSell.new(ticker: stock.ticker, name: stock.name, last_price: stock.last_price )
    stock_sell.save
    TransactionStockSell.create(user_id: current_user.id, stock_sell_id: stock_sell.id)
    AdminTransactionStockSell.create(user_id: current_user.id, stock_sell_id: stock_sell.id)
    user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first.destroy
    current_user.cash = current_user.cash + stock.last_price
    current_user.save
    flash[:notice] = "Sell successful"
    redirect_to my_portfolio_path
  end
end
