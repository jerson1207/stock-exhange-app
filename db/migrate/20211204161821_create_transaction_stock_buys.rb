class CreateTransactionStockBuys < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_stock_buys do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stock_buy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
