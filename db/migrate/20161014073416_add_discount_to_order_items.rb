class AddDiscountToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :discount, :decimal
  end
end
