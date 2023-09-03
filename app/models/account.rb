class Account < ApplicationRecord
	belongs_to :budget
	has_many :transactions
	validates :budget_id, presence: true
	validates :uid, presence: true, uniqueness: true
end
