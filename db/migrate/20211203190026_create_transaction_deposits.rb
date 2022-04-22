class CreateTransactionDeposits < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_deposits do |t|
      t.references :user, null: false, foreign_key: true
      t.references :deposit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
