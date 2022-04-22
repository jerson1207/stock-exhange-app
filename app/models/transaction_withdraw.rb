class TransactionWithdraw < ApplicationRecord
  belongs_to :user
  belongs_to :withdraw
end
