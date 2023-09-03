class Payee < ApplicationRecord
	belongs_to :budget
	has_many :payee_locations
	has_many :transactions
end
