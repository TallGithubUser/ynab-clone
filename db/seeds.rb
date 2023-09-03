budget_response = $ynab_api.budgets.get_budgets
budgets = budget_response.data.budgets

# Seed the budgets
puts "Seeding budgets..."
budgets.each do |budget|
  b = Budget.new(
  	uid: budget.id, 
  	name: budget.name,
  	last_modified_on: budget.last_modified_on,
  	first_month: budget.first_month,
  	last_month: budget.last_month
  )
  b.save
  puts "#{b.name}"

  accounts_response = $ynab_api.accounts.get_accounts(budget.id)
  accounts = accounts_response.data.accounts

  # Seed the accounts
  puts "Seeding accounts..."
  accounts.each do |account|
  	a = Account.new(
  		uid: account.id, 
  		name: account.name,
  		on_budget: account.on_budget,
  		closed: account.closed,
  		note: account.note, 
  		balance: account.balance, 
  		cleared_balance: account.cleared_balance,
  		uncleared_balance: account.uncleared_balance, 
  		transfer_payee_id: account.transfer_payee_id, 
  		direct_import_linked: account.direct_import_linked,
  		last_reconciled_at: account.last_reconciled_at,
  		deleted: account.deleted,
  		budget: b,
  	)
  	a.save
  	puts "#{account.name}"
  end
  puts "Done seeding accounts."

  # Seed the category groups
  categories_response = $ynab_api.categories.get_categories(budget.id)
  category_groups = categories_response.data.category_groups
  puts "Seeding category groups..."
  category_groups.each do |category_group|
  	cg = CategoryGroup.new(
  		uid: category_group.id,
  		name: category_group.name, 
  		hidden: category_group.hidden,
  		deleted: category_group.deleted,
  		budget: b
  	)
  	cg.save
  	puts "#{cg.name}"

  	# Seed the categories
  	puts "Seeding categories..."
  	category_group.categories.each do |category| 
  		c = Category.new(
  			uid: category.id,
  			name: category.name, 
  			hidden: category.hidden,
  			note: category.note,
  			budgeted: category.budgeted, 
  			activity: category.activity, 
  			balance: category.balance,
  			goal_type: category.goal_type,
  			goal_day: category.goal_day,
  			goal_cadence: category.goal_cadence,
  			goal_cadence_frequency: category.goal_cadence_frequency,
  			goal_creation_month: category.goal_creation_month, 
  			goal_target: category.goal_target,
  			goal_target_month: category.goal_target_month, 
  			goal_percentage_complete: category.goal_percentage_complete, 
  			goal_months_to_budget: category.goal_months_to_budget, 
  			goal_overall_funded: category.goal_overall_funded, 
  			goal_overall_left: category.goal_overall_left,
  			deleted: category.deleted,
  			category_group: cg
  		)
  		c.save
  		puts "#{c.name}"
  	end
  	puts "Done seeding categories."
  end
  puts "Done seeding caetgory groups."

  # Seed the payees
  payees_response = $ynab_api.payees.get_payees(budget.id)
  payees = payees_response.data.payees
  puts "Seeding payees..."
  payees.each do |payee| 
  	p = Payee.new(
  		uid: payee.id,
  		name: payee.name, 
  		deleted: payee.deleted,
  		budget: b
  	)
  	p.save
  	puts "#{p.name}"
  end
  puts "Done seeding payees."

  transactions_response = $ynab_api.transactions.get_transactions(budget.id)
  transactions = transactions_response.data.transactions

  # Seed the transactions
  puts "Seeding transactions..."
  transactions.each do |transaction|
  	payee_obj = Payee.find_by(uid: transaction.payee_id)
  	payee_name = ""
  	
  	if !payee_obj.nil?
  		payee_name = payee_obj.name
  	end

  	t = Transaction.new(
  		uid: transaction.id,
  		date: transaction.date,
  		amount: transaction.amount,
  		memo: transaction.memo,
  		cleared: transaction.cleared,
  		approved: transaction.approved, 
  		flag_color: transaction.flag_color,
  		deleted: transaction.deleted,
  		debt_transaction_type: transaction.debt_transaction_type,
  		payee: Payee.find_by(uid: transaction.payee_id),
  		category: Category.find_by(uid: transaction.category_id),
  		account: Account.find_by(uid: transaction.account_id),
  		import_id: transactino.import_id, 
  		matched_transaction_id: transaction.matched_transaction_id,
  		budget: b,
  	)
  	
  	puts "#{payee_name}"

  	t.save
  end
  puts "Done seeding transactions."
  puts "Done seeding budget."
end
puts "Done seeding."























