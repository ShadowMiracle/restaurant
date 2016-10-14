class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :subtotal
      t.integer :shipping
      t.integer :total
      t.string :order_name
      t.string :order_phone_number
      t.text :order_address

      t.timestamps
    end
  end
end
