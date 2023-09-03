class Budget < ApplicationRecord
	has_many :accounts
	has_many :category_groups
	has_many :payees
	has_many :payee_locations
	validates :uid, presence: true, uniqueness: true
end
