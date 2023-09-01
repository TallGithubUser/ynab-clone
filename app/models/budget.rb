class Budget < ApplicationRecord
	validates :uid, uniqueness: true, presence: true
	self.primary_key = :uid
end
