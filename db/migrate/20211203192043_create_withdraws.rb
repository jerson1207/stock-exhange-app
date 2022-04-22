class CreateWithdraws < ActiveRecord::Migration[6.1]
  def change
    create_table :withdraws do |t|
      t.decimal :amount

      t.timestamps
    end
  end
end
