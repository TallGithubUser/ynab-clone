class AccountController < ApplicationController
	def account_view
		last_100_transactions = Budget.find_by(uid:params[:uid]).transactions.reverse[0..100]
		
		@sanitized = []
		
		last_100_transactions.each do |transaction|
			category_group = "Category not needed"
			memo = "n/a"

			if not transaction.category.nil?
				category_group = "#{transaction.category.category_group.name} - #{transaction.category.name}"
			end

			if not transaction.memo.nil?
				memo = transaction.memo
			end

			outflow = inflow = "n/a"
			
			if transaction.amount < 0
				outflow = "-$#{'%.2f' % (transaction.amount / 1000.0 * -1.0)}"
			else 
				inflow = "$#{'%.2f' % (transaction.amount / 1000.0)}"
			end

			t = {
				:account_name => transaction.account.name,
				:date => transaction.date, 
				:payee => transaction.payee.name, 
				:category_group => category_group, 
				:memo => memo, 
				:outflow => outflow, 
				:inflow => inflow
			}

			@sanitized.push(t)
		end


	end
end
