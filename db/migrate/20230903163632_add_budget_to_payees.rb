class AddBudgetToPayees < ActiveRecord::Migration[7.0]
  def change
    add_reference :payees, :budget, null: false, foreign_key: true
  end
end
