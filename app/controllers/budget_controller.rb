class BudgetController < ApplicationController
	def index 
		@budget = Budget.find_by(uid: params[:budget_id])
		@category_groups = @budget.category_groups.order(:name)
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
