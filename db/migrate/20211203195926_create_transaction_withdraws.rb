class CreateTransactionWithdraws < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_withdraws do |t|
      t.references :user, null: false, foreign_key: true
      t.references :withdraw, null: false, foreign_key: true

      t.timestamps
    end
  end
end
