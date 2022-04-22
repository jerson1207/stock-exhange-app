class TransactionStockSellController < ApplicationController

  def destroy
    stock_sell = StockSell.find(params[:id])
    TransactionStockSell.where(user_id: current_user.id, stock_sell_id: stock_sell.id).first.destroy
    flash[:notice] = "Sell successful"
    redirect_to transaction_path
  end

end