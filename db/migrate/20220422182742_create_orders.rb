class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :Customer, null: false, foreign_key: true
      t.integer :total
      t.date :order_date

      t.timestamps
    end
  end
end
