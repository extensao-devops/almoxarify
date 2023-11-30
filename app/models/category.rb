class Category < ApplicationRecord
    has_enumeration_for :name, with: Categories, create_helpers: true
    has_many :items
    validates :name, presence: true
end
