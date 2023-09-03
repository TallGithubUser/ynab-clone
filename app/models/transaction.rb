class Transaction < ApplicationRecord
	belongs_to :payee
	belongs_to :account
	belongs_to :category
	belongs_to :budget
	validates :uid, presence: true, uniqueness: true
	validates :import_id, uniqueness: true
	validates :matched_transaction_id, uniqueness: true
end
