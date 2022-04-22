class AddCashToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :cash, :decimal, default: 0
  end
end
