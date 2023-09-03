class CategoryGroup < ApplicationRecord
	has_many :categories
	validates :uid, uniqueness: true, presence: true
end
