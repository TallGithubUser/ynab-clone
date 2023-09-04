class BudgetController < ApplicationController
	def budget_view 
		budget_id = params[:uid]
		@category_groups = Budget.find_by(uid: budget_id).category_groups.order(:name)
	end

	def default_budget_view
		all_budgets = Budget.all
		if all_budgets.length == 0
			redirect_to "/no-budgets-found/"
		else 
			default_budget_id = all_budgets.order(:last_modified_on)[-1].uid
			redirect_to "/#{default_budget_id}/budget"	
		end
	end

	def no_budgets_found	
	end
end
