class AddBudgetToPayeeLocation < ActiveRecord::Migration[7.0]
  def change
    add_reference :payee_locations, :budget, null: false, foreign_key: true
  end
end
