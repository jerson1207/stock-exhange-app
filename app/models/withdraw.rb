class Withdraw < ApplicationRecord

  has_many :transaction_withdraw
  has_many :users, through: :transaction_withdraw

end
