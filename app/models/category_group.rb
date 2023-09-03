class CategoryGroup < ApplicationRecord
	has_many :categories
	belongs_to :budget
	validates :uid, uniqueness: true, presence: true
end
