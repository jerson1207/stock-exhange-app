class AdminTransactionStockBuy < ApplicationRecord
  belongs_to :user
  belongs_to :stock_buy
end
