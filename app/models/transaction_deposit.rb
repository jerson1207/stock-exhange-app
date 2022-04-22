class TransactionDeposit < ApplicationRecord
  belongs_to :user
  belongs_to :deposit
end
