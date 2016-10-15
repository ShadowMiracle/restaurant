class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :comment_text
      t.integer :star, :default => 1
      t.references :food_item, foreign_key: true

      t.timestamps
    end
  end
end
