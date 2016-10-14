class FoodItem < ApplicationRecord
  belongs_to :section
  has_many :order_items
  is_impressionable

  def self.search(section_id, search)
    if section_id && search
      where("section_id = ? AND name LIKE ?", "#{section_id.to_s}", "%#{search}%")
    elsif section_id
      where("section_id = ?", "#{section_id.to_s}")
    elsif search
      where("name LIKE ?", "%#{search}%")
    else
      all
    end
  end
end
