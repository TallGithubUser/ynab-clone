class Transaction < ApplicationRecord
	belongs_to :payee
	belongs_to :accounts
	belongs_to :category
	validates :uid, presence: true, uniqueness: true
end
