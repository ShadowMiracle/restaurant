class AddColumnToFoodItem < ActiveRecord::Migration[5.0]
  def change
    add_column :food_items, :impressions_count, :integer, default: 0
  end
end
