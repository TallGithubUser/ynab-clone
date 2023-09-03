class AddBudgetToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_reference :accounts, :budget, null: false, foreign_key: true
  end
end
