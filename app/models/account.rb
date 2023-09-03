class Account < ApplicationRecord
	belongs_to :budget
	validates :budget_id, presence: true
	validates :uid, presence: true, uniqueness: true
end
