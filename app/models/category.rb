class Category < ApplicationRecord
	belongs_to :category_group
	validates :uid, presence: true, uniqueness: true
end
