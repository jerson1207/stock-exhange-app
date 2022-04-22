class TransactionStockBuyController < ApplicationController

  def destroy
    stock_buy = StockBuy.find(params[:id])
    TransactionStockBuy.where(user_id: current_user.id, stock_buy_id: stock_buy.id).first.destroy
    flash[:notice] = "Sell successful"
    redirect_to transaction_path
  end

end