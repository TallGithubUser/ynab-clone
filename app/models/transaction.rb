class Transaction < ApplicationRecord
	belongs_to :payee
	belongs_to :account
	belongs_to :category, optional: true
	belongs_to :budget
	validates :uid, presence: true, uniqueness: true
	validates :amount, presence: true, numericality: {greater_than: 0}
	validates :payee, presence: true
end
