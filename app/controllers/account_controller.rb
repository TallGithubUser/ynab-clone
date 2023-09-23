class AccountController < ApplicationController
	include ApplicationHelper
	def index
		budget = Budget.find_by(uid:params[:budget_id])
		@accounts = budget.accounts.order(:name)
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
