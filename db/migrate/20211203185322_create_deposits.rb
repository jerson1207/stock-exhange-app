class CreateDeposits < ActiveRecord::Migration[6.1]
  def change
    create_table :deposits do |t|
      t.decimal :amount

      t.timestamps
    end
  end
end
