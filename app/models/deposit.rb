class Deposit < ApplicationRecord

  has_many :transaction_deposits
  has_many :users, through: :transaction_deposits

end
