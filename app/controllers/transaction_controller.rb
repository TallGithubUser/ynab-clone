class TransactionController < ApplicationController
	def sanitize_transactions(transactions)
		sanitized = []
		transactions.each do |transaction|
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
				inflow = "+$#{'%.2f' % (transaction.amount / 1000.0)}"
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

			sanitized.push(t)
		end
		sanitized
	end

	def index
		budget = Budget.find_by(uid:params[:budget_id])
		last_100_transactions = budget.transactions.reverse[0..100]
		last_20_payees = Payee.all.reverse[0..20]

		open_accounts = Account.all.select{|account| account.budget == budget and account.closed == false}
		available_categories = Category.all.reject{|category| category.category_group.budget != budget}

		@categories_with_id = available_categories.map{|category| [category.name, category.id]}
		@payees_with_id = last_20_payees.map{|payee| [payee.name, payee.id]}
		@accounts_with_id = open_accounts.map{|account| [account.name, account.id]}
		@accounts = budget.accounts.order(:name)
		@transactions = sanitize_transactions(last_100_transactions)
	end

	def show
		@account = Account.find(params[:id])
		@transactions = sanitize_transactions(@account.transactions.reverse[0..100])
	end

	def new
		binding.pry
		@new_transaction = Transaction.new
	end

	def create
		t = Transaction.new (
			transaction_params
		)

		t.update ({
			uid: SecureRandom.uuid, 
			amount: (params[:amount].to_f*1000).floor,
			approved: true, 
			deleted: false, 
			budget: Budget.find_by(uid: params["budget_id"]), 
			date: Date.current
		})

	  	if t.save
			redirect_to "/#{params["budget_id"]}/transaction"	
		end
  	end

  	private 
		def transaction_params 
			params.permit(:memo, :cleared, :payee_id, :category_id, :account_id)
		end
end
