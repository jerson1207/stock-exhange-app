class User < ApplicationRecord

  has_many :user_stocks
  has_many :stocks, through: :user_stocks

  has_many :transaction_deposits
  has_many :deposits, through: :transaction_deposits

  has_many :transaction_withdraws
  has_many :withdraws, through: :transaction_withdraws

  has_many :transaction_stock_buys
  has_many :stock_buys, through: :transaction_stock_buys

  has_many :admin_transaction_stock_buys
  has_many :stock_buys, through: :admin_transaction_stock_buys

  has_many :transaction_stock_sells
  has_many :stock_sells, through: :transaction_stock_sells

  has_many :admin_transaction_stock_sells
  has_many :stock_sells, through: :admin_transaction_stock_sells

  validates :cash, numericality: { greater_than_or_equal_to: 0 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def stock_existed?(ticker_symbol)
    stock = Stock.check_record(ticker_symbol)
    return false unless stock
    stocks.where(id: stock.id).exists?
  end

  def price(ticker_symbol, cash)
    stock =  Stock.search_for(ticker_symbol)
     return stock.last_price < cash
  end

  def available?(ticker_symbol)
    !stock_existed?(ticker_symbol)
  end

end
