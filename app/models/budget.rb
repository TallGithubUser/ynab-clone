class Budget < ApplicationRecord
	has_many :accounts
	validates :uid, presence: true, uniqueness: true
end
