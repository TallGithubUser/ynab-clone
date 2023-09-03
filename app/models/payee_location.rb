class PayeeLocation < ApplicationRecord
	belongs_to :payee
	belongs_to :budget
end
