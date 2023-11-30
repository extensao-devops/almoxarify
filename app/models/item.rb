class Item < ApplicationRecord
	belongs_to :category
	validates :name, presence: true
	validates :category_id, presence: true
	validates :quantity, presence: true

	scope :by_category, lambda {|category|
		where("category = ?", category)
	}
end
