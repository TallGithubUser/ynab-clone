class Transaction < ApplicationRecord
	belongs_to :payee
	belongs_to :accounts
	belongs_to :category
end
