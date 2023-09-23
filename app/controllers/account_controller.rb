class AccountController < ApplicationController
	include ApplicationHelper
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
			redirect_to "/#{params["budget_id"]}/account"	
		end
  	end
end
