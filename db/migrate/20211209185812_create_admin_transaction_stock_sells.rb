class CreateAdminTransactionStockSells < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_transaction_stock_sells do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stock_sell, null: false, foreign_key: true

      t.timestamps
    end
  end
end
