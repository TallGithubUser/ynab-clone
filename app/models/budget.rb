class Budget < ApplicationRecord
	has_many :accounts
	has_many :category_groups
	has_many :payees
	validates :uid, presence: true, uniqueness: true
end
