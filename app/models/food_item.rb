class FoodItem < ApplicationRecord
  belongs_to :section
  has_many :order_items, dependent: :destroy
  has_many :comments, dependent: :destroy
  # is_impressionable :counter_cache => true, :unique => :request_hash
  is_impressionable :counter_cache => true, :unique => :all

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

  def sum_star
    @total_star = 0
    self.comments.each do |comment|
      @total_star += comment.star
    end
    @total_star
  end

  def comment_number
    self.comments.size
  end

  def average_star
    if comment_number == 0
      0
    else
      sum_star.to_f/comment_number
    end
  end
end
