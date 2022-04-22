class AdminTransactionStockSell < ApplicationRecord
  belongs_to :user
  belongs_to :stock_sell
end
