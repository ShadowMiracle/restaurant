class Section < ApplicationRecord
	validates :name, presence:true, uniqueness: {case_sensitive: false}
  has_many :FoodItem
	def self.generate_defaults
		["Breakfast", "Lunch", "Dinner", "Drinks"].each do |name|
			Section.find_or_create_by(name: name)
		end
	end
end
