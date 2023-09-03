class AddBudgetToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_reference :transactions, :budget, null: false, foreign_key: true
  end
end
