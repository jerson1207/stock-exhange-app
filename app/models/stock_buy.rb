class StockBuy < ApplicationRecord

  has_many :transaction_stock_buys
  has_many :users, through: :transaction_stock_buys

  has_many :admin_transaction_stock_buys
  has_many :users, through: :admin_transaction_stock_buys

end
