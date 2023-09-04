class Transaction < ApplicationRecord
	belongs_to :payee
	belongs_to :account
	belongs_to :category, optional: true
	belongs_to :budget
	validates :uid, presence: true, uniqueness: true
end
