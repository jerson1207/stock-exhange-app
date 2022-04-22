class StockSell < ApplicationRecord
  
  has_many :transaction_stock_sells
  has_many :users, through: :transaction_stock_sells
  
  has_many :admin_transaction_stock_sells
  has_many :users, through: :admin_transaction_stock_sells

end
