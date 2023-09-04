class BudgetController < ApplicationController
	def budget_view 
		budget_id = params[:uid]
		@accounts = Budget.find_by(uid: budget_id).accounts.order(:name)
	end

	def default_budget_view
		default_budget_id = Budget.all.order(:last_modified_on)[-1].uid
		redirect_to "/#{default_budget_id}/budget"
	end

end
