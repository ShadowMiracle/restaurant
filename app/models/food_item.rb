class FoodItem < ApplicationRecord
  belongs_to :section
  has_many :order_items, dependent: :destroy
  # is_impressionable :counter_cache => true, :unique => :request_hash
  is_impressionable :counter_cache => true, :unique => :all

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
